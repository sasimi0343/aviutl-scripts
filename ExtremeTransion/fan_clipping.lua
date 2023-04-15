    --[[�֐����g���ꍇ��
	requre("fan_clipping")
	�ƋL�q����Ί֐������̊֐����Ăяo����܂�
	track2�ȉ��̈����Ɋւ��Ă͓��͂��Ȃ��Ă��g����悤�ɏ������Ă��܂��̂�
	�Œ�ł�buffer,track0,track1��3�����ł��ݒ肵�Ă�������
	buffer�͗p����ۂɉ��z�o�b�t�@����������1�Ƃ��ăt���[���o�b�t�@�ɕ`�悷��ꍇ��0�ɂ��Ă�������
	fun_clipping(0,90,120)�̂悤�ɂ���΁A�t���[���o�b�t�@�Ɋ�p90�Ŋg���p120�x�Őݒ肳��܂�
	�V�[���Ȃǋ��ނƓ_�ł��邱�Ƃ�摜������邱�Ƃ��܂܂���܂�
	��x�L���b�V����p������ƒ���ꍇ������܂�
    ]]--
function fan_clipping(buffer,track0,track1,track2,track3,check0,alpha,edg,dth,mono,col,st,lum,bl,range,asp,fla,fst,di,th,vd,fcol)
	if buffer~=1 then buffer=0 end
	if track2==nil then track2=0 end
	if track3==nil then track3=0 end
	if check0==0 then check0=false end
	if alpha==nil then alpha=100 end
	if edg==nil then edg=0 end
	if mono==nil then mono=0 end
	if bl==nil then bl=0 end
	if fla==nil then fla=0 end
	--alpha�̒l�͈̔͂�0����100�܂łƂ��܂�
	if alpha<0 then alpha=0 elseif 100<alpha then alpha=100 end
	track0=track0%360
	if track1<-360 then track1=-360 elseif 360<track1 then track1=360 end
	--���X���鉼�z�o�b�t�@���ꎞ���
	obj.copybuffer("cache:tmptmp","tmp");

	--�΂߃N���b�s���O�̋��E�̃S�~�����S�Ɏ��Ȃ��̂�track0��0��-360��360�̂Ƃ��͎΂߃N���b�s���O���g��Ȃ��悤�ɂ���
	--�����x��100�̂Ƃ���
	if(alpha~=100 and (track1==360 or track1==-360))then
		--�����̓N���b�s���O�Ō������镔���̃I�u�W�F�N�g
		if edg==1 then
			obj.effect("�G�b�W���o","�������l",dth)
		end
		if mono==1 then
			obj.effect("�P�F��","����",st,"color",col,"�P�x��ێ�����",lum)
		end
		if bl==1 then
			obj.effect("�ڂ���","�͈�",range,"�c����",asp,"�T�C�Y�Œ�",1)
		end
		if fla==1 then
			--fcol�̗L���Ō��̐F�ݒ������������I��
			if fcol=="" then
				obj.effect("����","����",fst,"�g�U",di,"�������l",th,"�g�U���x",vd,"no_color",1,"�T�C�Y�Œ�",1)
			else
				obj.effect("����","����",fst,"�g�U",di,"�������l",th,"�g�U���x",vd,"color",tonumber(fcol),"no_color",0,"�T�C�Y�Œ�",1)
			end
		end
		--�����x��ݒ�
		obj.alpha=obj.alpha*(1-alpha*0.01)

	elseif(track1~=0)then
		--track1��0�ȊO�̂Ƃ��͌��I�u�W�F�N�g���N���b�s���O�����
		--���I�u�W�F�N�g�̃C���[�W��ۑ�
		obj.copybuffer("cache:dclip1","obj")
		w,h=obj.getpixel()
		if(alpha~=100)then
			--alpha��100�ȊO�̂Ƃ��͌����������\�������̂ŁA���̃C���[�W�𐧍삵�ĕۑ�
			if edg==1 then
				obj.effect("�G�b�W���o","�������l",dth)
			end
			if mono==1 then
				obj.effect("�P�F��","����",st,"color",col,"�P�x��ێ�����",lum)
			end
			if bl==1 then
				obj.effect("�ڂ���","�͈�",range,"�c����",asp,"�T�C�Y�Œ�",1)
			end
			if fla==1 then
				if fcol=="" then
					obj.effect("����","����",fst,"�g�U",di,"�������l",th,"�g�U���x",vd,"no_color",1,"�T�C�Y�Œ�",1)
				else
					obj.effect("����","����",fst,"�g�U",di,"�������l",th,"�g�U���x",vd,"color",tonumber(fcol),"no_color",0,"�T�C�Y�Œ�",1)
				end
			end
			obj.copybuffer("cache:dclip2","obj")
		end
		--���z�o�b�t�@�ŕ����̉摜�ƈꖇ�̃I�u�W�F�N�g��
		obj.setoption("drawtarget","tempbuffer",w,h)
		--�u�����h��"alpha_add"�ɂ��Č��Ԃ𖄂߂�
		obj.setoption("blend","alpha_add")
		--obj.check0�Ń^�C�v���d������
		if(not check0)then
			--�����������v�^�C�v
			--���I�u�W�F�N�g�̃C���[�W���Ăяo��
			obj.copybuffer("obj","cache:dclip1")
			--�΂߃N���b�s���O���x����
			obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0)
			if(0<=track1)then
				obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+track1)
			elseif(track1<=-180)then
				obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+track1+180)
			end
			if(-360<track1 and track1<180)then
				obj.draw()
			end
			--��p�ӂ��邱�ƂŐ�`���Ȃ�
			--�p�x��180�x�����Ĕ����������Ĕ��]������
			obj.copybuffer("obj","cache:dclip1");
			obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+180)
			if(180<track1)then
				obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+track1)
			elseif(track1<0)then
				obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+180+track1)
			end
			if(-180<track1 and track1<360)then
				obj.draw()
			end
			--��������͌��������̃I�u�W�F�N�g���H
			if(alpha~=100)then
				--���������̃C���[�W���Ăяo��
				obj.copybuffer("obj","cache:dclip2")
				obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0)
				if(track1<=-180)then
					obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+track1)
				elseif(track1<180)then
					obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+180+track1)
				end
				if(track1<-180 or 0<track1)then
					obj.draw(0,0,0,1,1-alpha*0.01)
				end
				obj.copybuffer("obj","cache:dclip2")
				obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+180)
				if(0<track1)then
					obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+track1+180)
				elseif(-180<track1)then
					obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+track1)
				end
				if(track1<0 or 180<track1)then
					obj.draw(0,0,0,1,1-alpha*0.01)
				end
			end
		else
			--�����͍L����悤�ȃ^�C�v
			--�g���p�𔼕��ɂ��邱�ƂŁA360�őS�J�ɂ���
			track1=track1*0.5
			obj.copybuffer("obj","cache:dclip1");
			obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0)
			obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+track1)
			if(-180<track1 and track1<180)then
				obj.draw()
			end
			obj.copybuffer("obj","cache:dclip1");
			obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+180)
			obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+180-track1)
			if(-180<track1 and track1<180)then
				obj.draw()
			end
			--��������͌��������̃I�u�W�F�N�g���H
			if(alpha~=100)then
				obj.copybuffer("obj","cache:dclip2");
				obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0)
				obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+track1+180)
				if(-180<track1 and track1<180)then
					obj.draw(0,0,0,1,1-alpha*0.01)
				end
				obj.copybuffer("obj","cache:dclip2");
				obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0+180)
				obj.effect("�΂߃N���b�s���O","���SX",track2,"���SY",track3,"�ڂ���",0,"�p�x",track0-track1)
				if(-180<track1 and track1<180)then
					obj.draw(0,0,0,1,1-alpha*0.01)
				end
			end
		end
		--���z�o�b�t�@�̃C���[�W���I�u�W�F�N�g�ɔ��f������Aobj.load("tempbuffer")�Ɠ����ł����A�R�s�[������������������
		--�Ⴂ��obj.ox��obj.alpha�����������邩�ŁA���[�h����Ə������ł��܂�������K�v���Ȃ��̂ŃR�s�[�ł��܂���
		obj.copybuffer("obj","tmp")
		if buffer==0 then
			obj.setoption("drawtarget","framebuffer")
		end
		obj.copybuffer("tmp","cache:tmptmp")
	end
end
