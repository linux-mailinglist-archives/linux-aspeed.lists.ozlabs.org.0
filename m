Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1523D98C993
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 01:45:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJF1B5Vw5z302T
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 09:45:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727779268;
	cv=none; b=cJsD2Hv+jJGt5I/KUX8D2diM6pK8JH1peiO7aIyXBaI9W9tLYmlifz5f+1uF2L25RJ5MYXbVFUx37GlCbmh3dXEHyK1n+4r/2hOHw5In1qyaOsR1XsNMxQeiURTPHZOWWbE1ZT978/cyhlFRZFJ1WLjsfgUPUXdbAuqoa6VJ7x8leE70Lfpzto5sfTe9JEXkZEmqA7lq6W28tN7Dbf2KsuyRyOY5/0WmrtBtMd8at7VBV8nqsq4OC1DQVnumV2qeaqeTT5m8WBjw/GzZZj+yuJCyQympE3HLRve9c8g28CFiUXxkud+uTLX12ZY8tS8FpyAvPCFtUDatuguzqkY6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727779268; c=relaxed/relaxed;
	bh=9a7UBYm413oWkXRDg0AyOa5DSiVyV1nG7mQJn3kp3MM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=X1VkMh9TXTe+M11m/ywsVtSBBf3QLxATZZFS6DRpm2FB+06PLpJxHYJL7gsc1aF12tL71MKtdIbyigSbbUPk1QOhDjVJFCYQe9FOM0XiCDBvOFjx60KbvByYmECNew3CRD2/ob38D+5N3w8RBbL7ChJKpaTEeaPoTWa2HY++zPsf4WP6p0eCSzG4dpa5hdZYaaXpu6JJlbalXq5PZZOKdPvgpi8tPPYm5x5YTx6BRJ3CFBUDN9j7Ggi8BkHgeqbsYctbZz7sGiIzf4RuUJaOy5w4qi57ILpggxKnZDeo9KJzg2HPdIyS0rglDhnnbmRh+9j/azcuyVc3CFdG1wZBtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr; dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=L0ohmIoY; dkim-atps=neutral; spf=pass (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org) smtp.mailfrom=inria.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=L0ohmIoY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inria.fr (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHvcK0lmJz2xjh;
	Tue,  1 Oct 2024 20:41:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9a7UBYm413oWkXRDg0AyOa5DSiVyV1nG7mQJn3kp3MM=;
  b=L0ohmIoY9MO7NWrXbMXMY5Sc0lvbTMc1GhR8FgB7Y2XdMSCghpT4QxjU
   r38hB1CpnCVHSMa+idX19Tb1l0on1yCdHSn1sJGoZvC4DiiSItUPVr1+w
   AlMZxHhA8MWWl40DjcM41zxKN143hjB3gdhPon6hHfKJ4I8rr50gkrAs7
   0=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,167,1725314400"; 
   d="scan'208";a="97880312"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 12:40:53 +0200
Date: Tue, 1 Oct 2024 12:40:52 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
In-Reply-To: <6d5c5971-cbd3-4118-86d6-65a895336936@xs4all.nl>
Message-ID: <ddee447-be49-5cd0-d284-17289f917e8@inria.fr>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org> <20240930122157.GF31662@pendragon.ideasonboard.com> <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl> <CANiDSCt4Xh27WSosNPB8Y_OjHr787f31PpKZWf2ZLPjFw51uBA@mail.gmail.com>
 <249a777-8ff6-59e5-3e80-ad4348e3bd62@inria.fr> <6d5c5971-cbd3-4118-86d6-65a895336936@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 02 Oct 2024 09:45:16 +1000
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: imx@lists.linux.dev, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sean Young <sean@mess.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>, Olli Salonen <olli.salonen@iki.fi>, linux-aspeed@lists.ozlabs.org, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Kozlov <serjk@netup.ru>, Maxim Levitsky <maximlevitsky@gmail.com>, Patrick Boettcher <patrick.boettcher@posteo.de>, Mike Isely <isely@pobox.com>, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, Bingbu Cao <bingbu.cao@intel.com>, Tim Harvey <tharvey@gateworks.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>, Jemma Denson <jdenson@gmail.com>, Michal Simek <michal.simek@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>, =?ISO-8859-15?Q?Niklas_S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Andy Walls <awalls@md.metrocast.net>, Zhou Peng <eagle.zhou@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Julia Lawall <julia.lawall@inria.fr>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> >> Julia, correct me if I am wrong, but I believe that cocci does not
> >> have the ability to check only new code. It runs against files not
> >> diffs.
> >
> > Coccinelle runs on files normally.  There is an option --use-patch-diff
> > where you can give a commit id, and it should only work on the files
> > mentioned in that commit, but it doesn't seem to focus on only the new
> > code in that commit.
>
> Is it possible to add support for that?

It should be possible.  The tricky part is that Coccinelle can match eg

foo();
...
-bar()
+xxx()

So should the code be patched only if bar() is new?  Or also if foo() is new.

> And a related question: is it possible to skip certain tests?

You can specify the test you want to have run, but I don't think there is a
way to do the opposite:

make coccicheck COCCI=<my_SP.cocci> MODE=patch

Maybe if there is a way to focus on specific lines, the problem would go away?

julia

>
> Basically, I don't want to see reports of code improvements, unless it is
> for a new source file. Reports of dangerous/wrong constructs are always
> welcome, but code improvements like these string_choice helpers really only
> make sense for patches adding new source files.
>
> Regards,
>
> 	Hans
>
> >
> > julia
> >
> >>
> >> I agree with you, a "improvement cocci" shall not force us to drop the
> >> pen and work full time to fix it :)
> >> When a new "improvement" cocci check is landed, we should update our
> >> "allowlist" immediately to ignore those warnings until we slowly
> >> improve our codebase to meet the standard.
> >> That way the CI is not affected.
> >>
> >> Regarding this patchset.... It is pretty big, but also pretty simple.
> >> I added my "extra changes" on the cover letter to ease the review.
> >>
> >> If you or someone else have time to review it... then it will be great
> >> if we land it. But if none has time for it, then it can be ignored.
> >>
> >>
> >> Regards!
> >>
> >>>
> >>>         Hans
> >>>
> >>>>
> >>>>> diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
> >>>>> index 8c3eb5d69dda..ec7a718428fc 100644
> >>>>> --- a/drivers/media/dvb-frontends/ascot2e.c
> >>>>> +++ b/drivers/media/dvb-frontends/ascot2e.c
> >>>>> @@ -104,7 +104,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv *priv,
> >>>>>                               u8 reg, u8 write, const u8 *data, u32 len)
> >>>>>  {
> >>>>>         dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n",
> >>>>> -               str_read_write(write == 0), reg, len);
> >>>>> +               str_write_read(write), reg, len);
> >>>>>         print_hex_dump_bytes("ascot2e: I2C data: ",
> >>>>>                 DUMP_PREFIX_OFFSET, data, len);
> >>>>>  }
> >>>>> diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
> >>>>> index db684f314b47..d1b84cd9c510 100644
> >>>>> --- a/drivers/media/dvb-frontends/cxd2841er.c
> >>>>> +++ b/drivers/media/dvb-frontends/cxd2841er.c
> >>>>> @@ -206,7 +206,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_priv *priv,
> >>>>>  {
> >>>>>         dev_dbg(&priv->i2c->dev,
> >>>>>                 "cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %*ph\n",
> >>>>> -               str_read_write(write == 0), addr, reg, len, len, data);
> >>>>> +               str_write_read(write), addr, reg, len, len, data);
> >>>>>  }
> >>>>>
> >>>>>  static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
> >>>>> diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
> >>>>> index 52198cb49dba..b4527c141d9c 100644
> >>>>> --- a/drivers/media/dvb-frontends/helene.c
> >>>>> +++ b/drivers/media/dvb-frontends/helene.c
> >>>>> @@ -279,7 +279,7 @@ static void helene_i2c_debug(struct helene_priv *priv,
> >>>>>                 u8 reg, u8 write, const u8 *data, u32 len)
> >>>>>  {
> >>>>>         dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n",
> >>>>> -                       str_read_write(write == 0), reg, len);
> >>>>> +                       str_write_read(write), reg, len);
> >>>>>         print_hex_dump_bytes("helene: I2C data: ",
> >>>>>                         DUMP_PREFIX_OFFSET, data, len);
> >>>>>  }
> >>>>> diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb-frontends/horus3a.c
> >>>>> index 84385079918c..10300ebf3ca0 100644
> >>>>> --- a/drivers/media/dvb-frontends/horus3a.c
> >>>>> +++ b/drivers/media/dvb-frontends/horus3a.c
> >>>>> @@ -38,7 +38,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *priv,
> >>>>>                               u8 reg, u8 write, const u8 *data, u32 len)
> >>>>>  {
> >>>>>         dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n",
> >>>>> -               str_read_write(write == 0), reg, len);
> >>>>> +               str_write_read(write), reg, len);
> >>>>>         print_hex_dump_bytes("horus3a: I2C data: ",
> >>>>>                 DUMP_PREFIX_OFFSET, data, len);
> >>>>>  }
> >>>>> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
> >>>>> index ba174aa45afa..a43479c3ff03 100644
> >>>>> --- a/drivers/media/i2c/adv7842.c
> >>>>> +++ b/drivers/media/i2c/adv7842.c
> >>>>> @@ -2763,7 +2763,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
> >>>>>                           str_true_false(io_read(sd, 0x6a) & 0x10));
> >>>>>         }
> >>>>>         v4l2_info(sd, "CP free run: %s\n",
> >>>>> -                 str_on_off(!!(cp_read(sd, 0xff) & 0x10)));
> >>>>> +                 str_on_off(cp_read(sd, 0xff) & 0x10));
> >>>>>         v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
> >>>>>                   io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
> >>>>>                   (io_read(sd, 0x01) & 0x70) >> 4);
> >>>>> diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
> >>>>> index 301b89e799d8..79cd61fb0205 100644
> >>>>> --- a/drivers/media/pci/saa7134/saa7134-cards.c
> >>>>> +++ b/drivers/media/pci/saa7134/saa7134-cards.c
> >>>>> @@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
> >>>>>                         rc = i2c_transfer(&dev->i2c_adap, &msg, 1);
> >>>>>                         pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n",
> >>>>>                                    dev->name, msg.addr,
> >>>>> -                                  str_yes_no(1 == rc));
> >>>>> +                                  str_yes_no(rc == 1));
> >>>>>                         if (rc == 1)
> >>>>>                                 dev->has_remote = SAA7134_REMOTE_I2C;
> >>>>>                 }
> >>>>> diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
> >>>>> index 90837ec6e70f..239f0b9d080a 100644
> >>>>> --- a/drivers/media/pci/saa7134/saa7134-input.c
> >>>>> +++ b/drivers/media/pci/saa7134/saa7134-input.c
> >>>>> @@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
> >>>>>                 rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
> >>>>>                 input_dbg("probe 0x%02x @ %s: %s\n",
> >>>>>                         msg_msi.addr, dev->i2c_adap.name,
> >>>>> -                       str_yes_no(1 == rc));
> >>>>> +                       str_yes_no(rc == 1));
> >>>>>                 break;
> >>>>>         case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
> >>>>>                 dev->init_data.name = "SnaZio* TVPVR PRO";
> >>>>> @@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
> >>>>>                 rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
> >>>>>                 input_dbg("probe 0x%02x @ %s: %s\n",
> >>>>>                         msg_msi.addr, dev->i2c_adap.name,
> >>>>> -                       str_yes_no(1 == rc));
> >>>>> +                       str_yes_no(rc == 1));
> >>>>>                 break;
> >>>>>         case SAA7134_BOARD_HAUPPAUGE_HVR1110:
> >>>>>                 dev->init_data.name = saa7134_boards[dev->board].name;
> >>>>> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> >>>>> index 448c40caf363..b6c9bda214c8 100644
> >>>>> --- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> >>>>> +++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> >>>>> @@ -521,7 +521,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ctrl *cptr,
> >>>>>                 *len = scnprintf(buf,maxlen,"%d",val);
> >>>>>                 ret = 0;
> >>>>>         } else if (cptr->info->type == pvr2_ctl_bool) {
> >>>>> -               *len = scnprintf(buf,maxlen,"%s",str_true_false(val));
> >>>>> +               *len = scnprintf(buf, maxlen, "%s", str_true_false(val));
> >>>>>                 ret = 0;
> >>>>>         } else if (cptr->info->type == pvr2_ctl_enum) {
> >>>>>                 const char * const *names;
> >>>>> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >>>>> index 96d3a0045fac..761d718478ca 100644
> >>>>> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >>>>> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >>>>> @@ -338,7 +338,7 @@ static void trace_stbit(const char *name,int val)
> >>>>>  {
> >>>>>         pvr2_trace(PVR2_TRACE_STBITS,
> >>>>>                    "State bit %s <-- %s",
> >>>>> -                  name,str_true_false(val));
> >>>>> +                  name, str_true_false(val));
> >>>>>  }
> >>>>>
> >>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>>> ---
> >>>>> Ricardo Ribalda (45):
> >>>>>       media: staging: ipu3: Use string_choices helpers
> >>>>>       media: staging: atomisp: Use string_choices helpers
> >>>>>       media: core: Use string_choices helpers
> >>>>>       media: pwc-ctl: Use string_choices helpers
> >>>>>       media: pvrusb2:Use string_choices helpers
> >>>>>       media: em28xx: Use string_choices helpers
> >>>>>       media: dvb-usb: Use string_choices helpers
> >>>>>       media: dvb-usb-v2: Use string_choices helpers
> >>>>>       media: cx231xx: Use string_choices helpers
> >>>>>       media: tuners: Use string_choices helpers
> >>>>>       media: rc: Use string_choices helpers
> >>>>>       media: dvb-frontends: Use string_choices helpers
> >>>>>       media: pci: cx23885: Use string_choices helpers
> >>>>>       media: saa7134: Use string_choices helpers
> >>>>>       media: amphion: Use string_choices helpers
> >>>>>       media: pci: ivtv: Use string_choices helpers
> >>>>>       media: bttv: Use string_choices helpers
> >>>>>       media: xilinx: Use string_choices helpers
> >>>>>       media: platform: ti: Use string_choices helpers
> >>>>>       media: st: Use string_choices helpers
> >>>>>       media: coda: Use string_choices helpers
> >>>>>       media: aspeed: Use string_choices helpers
> >>>>>       media: ipu6: Use string_choices helpers
> >>>>>       media: cx18: Use string_choices helpers
> >>>>>       media: cobalt: Use string_choices helpers
> >>>>>       media: videobuf2: Use string_choices helpers
> >>>>>       media: cec: Use string_choices helpers
> >>>>>       media: b2c2: Use string_choices helpers
> >>>>>       media: siano: Use string_choices helpers
> >>>>>       media: i2c: cx25840: Use string_choices helpers
> >>>>>       media: i2c: vpx3220: Use string_choices helpers
> >>>>>       media: i2c: tvp7002: Use string_choices helpers
> >>>>>       media: i2c: ths8200: Use string_choices helpers
> >>>>>       media: i2c: tda1997x: Use string_choices helpers
> >>>>>       media: i2c: tc358743: Use string_choices helpers
> >>>>>       media: i2c: st-mipid02: Use string_choices helpers
> >>>>>       media: i2c: msp3400: Use string_choices helpers
> >>>>>       media: i2c: max9286: Use string_choices helpers
> >>>>>       media: i2c: saa717x: Use string_choices helpers
> >>>>>       media: i2c: saa7127: Use string_choices helpers
> >>>>>       media: i2c: saa7115: Use string_choices helpers
> >>>>>       media: i2c: saa7110: Use string_choices helpers
> >>>>>       media: i2c: adv7842: Use string_choices helpers
> >>>>>       media: i2c: adv76xx: Use string_choices helpers
> >>>>>       media: i2c: adv7511: Use string_choices helpers
> >>>>>
> >>>>>  drivers/media/cec/platform/cec-gpio/cec-gpio.c     |  4 +-
> >>>>>  drivers/media/cec/usb/pulse8/pulse8-cec.c          |  4 +-
> >>>>>  drivers/media/common/b2c2/flexcop-hw-filter.c      |  4 +-
> >>>>>  drivers/media/common/siano/sms-cards.c             |  3 +-
> >>>>>  drivers/media/common/videobuf2/videobuf2-core.c    |  5 ++-
> >>>>>  drivers/media/dvb-frontends/ascot2e.c              |  2 +-
> >>>>>  drivers/media/dvb-frontends/cx24120.c              |  4 +-
> >>>>>  drivers/media/dvb-frontends/cxd2841er.c            |  2 +-
> >>>>>  drivers/media/dvb-frontends/drxk_hard.c            |  4 +-
> >>>>>  drivers/media/dvb-frontends/helene.c               |  2 +-
> >>>>>  drivers/media/dvb-frontends/horus3a.c              |  2 +-
> >>>>>  drivers/media/dvb-frontends/sp2.c                  |  2 +-
> >>>>>  drivers/media/i2c/adv7511-v4l2.c                   | 11 +++---
> >>>>>  drivers/media/i2c/adv7604.c                        | 25 ++++++------
> >>>>>  drivers/media/i2c/adv7842.c                        | 40 ++++++++++----------
> >>>>>  drivers/media/i2c/cx25840/cx25840-core.c           |  4 +-
> >>>>>  drivers/media/i2c/cx25840/cx25840-ir.c             | 34 ++++++++---------
> >>>>>  drivers/media/i2c/max9286.c                        |  2 +-
> >>>>>  drivers/media/i2c/msp3400-driver.c                 |  4 +-
> >>>>>  drivers/media/i2c/saa7110.c                        |  2 +-
> >>>>>  drivers/media/i2c/saa7115.c                        |  2 +-
> >>>>>  drivers/media/i2c/saa7127.c                        | 15 +++++---
> >>>>>  drivers/media/i2c/saa717x.c                        |  2 +-
> >>>>>  drivers/media/i2c/st-mipid02.c                     |  2 +-
> >>>>>  drivers/media/i2c/tc358743.c                       | 44 ++++++++++------------
> >>>>>  drivers/media/i2c/tda1997x.c                       |  6 +--
> >>>>>  drivers/media/i2c/ths8200.c                        |  4 +-
> >>>>>  drivers/media/i2c/tvp7002.c                        |  2 +-
> >>>>>  drivers/media/i2c/vpx3220.c                        |  2 +-
> >>>>>  drivers/media/pci/bt8xx/bttv-cards.c               | 16 ++++----
> >>>>>  drivers/media/pci/bt8xx/bttv-driver.c              |  6 +--
> >>>>>  drivers/media/pci/cobalt/cobalt-driver.c           |  2 +-
> >>>>>  drivers/media/pci/cx18/cx18-av-core.c              |  4 +-
> >>>>>  drivers/media/pci/cx23885/altera-ci.c              |  2 +-
> >>>>>  drivers/media/pci/cx23885/cimax2.c                 |  2 +-
> >>>>>  drivers/media/pci/cx23885/cx23888-ir.c             | 36 +++++++++---------
> >>>>>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  2 +-
> >>>>>  drivers/media/pci/ivtv/ivtvfb.c                    |  4 +-
> >>>>>  drivers/media/pci/saa7134/saa7134-cards.c          |  2 +-
> >>>>>  drivers/media/pci/saa7134/saa7134-dvb.c            |  2 +-
> >>>>>  drivers/media/pci/saa7134/saa7134-input.c          |  6 +--
> >>>>>  drivers/media/pci/saa7134/saa7134-video.c          |  2 +-
> >>>>>  drivers/media/platform/amphion/venc.c              |  2 +-
> >>>>>  drivers/media/platform/amphion/vpu_dbg.c           |  2 +-
> >>>>>  drivers/media/platform/aspeed/aspeed-video.c       |  4 +-
> >>>>>  drivers/media/platform/chips-media/coda/imx-vdoa.c |  3 +-
> >>>>>  drivers/media/platform/st/sti/hva/hva-debugfs.c    |  6 +--
> >>>>>  drivers/media/platform/ti/omap3isp/ispstat.c       |  2 +-
> >>>>>  drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 18 ++++-----
> >>>>>  drivers/media/rc/ene_ir.c                          |  3 +-
> >>>>>  drivers/media/rc/mceusb.c                          |  3 +-
> >>>>>  drivers/media/rc/serial_ir.c                       |  5 ++-
> >>>>>  drivers/media/tuners/tda18250.c                    |  2 +-
> >>>>>  drivers/media/tuners/tda9887.c                     | 10 ++---
> >>>>>  drivers/media/usb/cx231xx/cx231xx-i2c.c            |  4 +-
> >>>>>  drivers/media/usb/cx231xx/cx231xx-video.c          |  2 +-
> >>>>>  drivers/media/usb/dvb-usb-v2/az6007.c              |  4 +-
> >>>>>  drivers/media/usb/dvb-usb-v2/dvb_usb_core.c        |  4 +-
> >>>>>  drivers/media/usb/dvb-usb/af9005-fe.c              |  4 +-
> >>>>>  drivers/media/usb/dvb-usb/dvb-usb-dvb.c            |  6 +--
> >>>>>  drivers/media/usb/dvb-usb/opera1.c                 |  8 ++--
> >>>>>  drivers/media/usb/em28xx/em28xx-i2c.c              |  4 +-
> >>>>>  drivers/media/usb/em28xx/em28xx-video.c            |  2 +-
> >>>>>  drivers/media/usb/pvrusb2/pvrusb2-ctrl.c           |  2 +-
> >>>>>  drivers/media/usb/pvrusb2/pvrusb2-debugifc.c       |  3 +-
> >>>>>  drivers/media/usb/pvrusb2/pvrusb2-encoder.c        |  5 +--
> >>>>>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |  6 +--
> >>>>>  drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c       |  3 +-
> >>>>>  drivers/media/usb/pwc/pwc-ctrl.c                   |  2 +-
> >>>>>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +-
> >>>>>  drivers/media/v4l2-core/v4l2-fwnode.c              | 12 +++---
> >>>>>  .../media/atomisp/pci/atomisp_compat_css20.c       |  2 +-
> >>>>>  .../media/atomisp/pci/atomisp_csi2_bridge.c        |  2 +-
> >>>>>  .../media/atomisp/pci/atomisp_gmin_platform.c      |  4 +-
> >>>>>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  4 +-
> >>>>>  .../media/atomisp/pci/runtime/binary/src/binary.c  |  2 +-
> >>>>>  drivers/staging/media/atomisp/pci/sh_css.c         |  2 +-
> >>>>>  drivers/staging/media/ipu3/ipu3-v4l2.c             |  4 +-
> >>>>>  78 files changed, 240 insertions(+), 239 deletions(-)
> >>>>> ---
> >>>>> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> >>>>> change-id: 20240930-cocci-opportunity-40bca6a17c42
> >>>>
> >>>
> >>
> >>
> >> --
> >> Ricardo Ribalda
> >>
> >
>
>
