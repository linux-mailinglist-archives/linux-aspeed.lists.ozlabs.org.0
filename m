Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B598B067
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbks3SMcz3vcM
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::734"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727710823;
	cv=none; b=aCvkMwtMukEr2ZzNPGL28ReubRT0XOuaq2JNqpqLp3piYBLeptWMYky6ejyIQyItN+dJP+Qle7ot0Ff4UJLc6hhRY4aCIfaMfukt1qY2FTgFgPox6N/X8mR3fMf4NIWwe00/zE117hp+pEMR024RMsatMMbJZTeCzisjR+Gn0YAggUaEWXrMDEYkFdnxUpLvksX5FSvnt+/zZsC5NyPB2BaC9q8zx4S9ePDYVFY2x0JQUPpLSseSYr0LSfnyda/Dk24eWRbHjMGZTG2sHHO/sENr48zxaAFP6f+UrKzzG5S10LlP0FxkOfnhRgG/sAOijyoh6gFIDKEwbrffuOKh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727710823; c=relaxed/relaxed;
	bh=QZc5l7HwmrBo73UWrdHZ1JVPdCSgRTelmWziJOuNMk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5HTiZckZpHnvbyXclT8xaSCDTz1Umb0Z+5oYNmbya+sibOtExZL54Gpe2lMcbw35F8BI5YdHXJNOWqThBReV52L79Lie5qDC2Q1rOcsEveQfg4J5xQpelqx+DLVkMusHVvGfEF1PpWAL4tVHjliH0SUEkArE1cFFr0eEsmd17in1AdIQduKWW+CTY85B9OjdAwhBgg6rKWUUeRV51xYmiRKes6+/r1bcug58NXWR36ZYS2XdHz8RPEpbHqy5/RZx+iW8gSOEIFi5KONJe3hAJNnxhaL0/47cx1XGLo5Umep9AgTgsaGj65RfL9PjjJP3ERL6dNciYvvLcQ7bbkY5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i2S/Wybz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=tfiga@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i2S/Wybz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=tfiga@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHQJ63C1rz2ywS
	for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Oct 2024 01:40:20 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7a9ae8fc076so497190385a.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 08:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727710818; x=1728315618; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZc5l7HwmrBo73UWrdHZ1JVPdCSgRTelmWziJOuNMk4=;
        b=i2S/WybzbOsTGH6Ycuwwa3hDcJ9dfYisKGmJrZc2gR04dtP/IQQqQJFRGU92ZBXsha
         W80e3Zi7bOkttSQrRstzhpZWrDHUPxtU5u+QvpkNii4fMoFmb3SgBz1mPtUlvQLKTIZr
         HUGo/uO2yNSbXh4PYwUyNVAc1qhjU1hXeVcnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727710818; x=1728315618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZc5l7HwmrBo73UWrdHZ1JVPdCSgRTelmWziJOuNMk4=;
        b=V+0I7g0KrUoi6SshtH0YtW3HRRbAyMyg3dlTiqzuJ9arAagQwdMyEjdkAhM0F7b95/
         gljPL/a3VjDN63nGaW4srU0iPf4LjefeYDDTEgaSVq/i5KpOl0BCwzwwYz41KotPnZRX
         WF8hOsfygjS+V4MiEVNTgwlfoSAN53XJ6xz+64KoAewVaIhE3qTUYnWO1ZJzLtZ6qcSC
         jS7/llOdHc3txe+q5zrPcb1DuXnSAGK8cd4wgO4chJ8u2nEMfBbo00YEfCP1g2nDZEs6
         zq9sAUBscSTxFBbAbV/KWPaLF2KMQ17W+uyeiprrHq0wHAd6La7p1kjnmSLhRX3xw2V/
         QBow==
X-Forwarded-Encrypted: i=1; AJvYcCXMo/thA2AaYJg82v0UhKGt0ZHNj7UeaU7pXPFUlXI8oQ2oxYPjISbMnD45S+c6ZPRpVN+pB0Zg16JsyLA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZVUGnSwYapFv0Ue0o5cZFjbz1T6uEtlwMU7MHoVm2A2ERH299
	D40fLcJOlqea5q5AWA5rKKyvyco23Ojo+6Dey4bfyt/6ciTEKmJ5uF8YCpERKwWVvf9P1d8eJCj
	jGQ==
X-Google-Smtp-Source: AGHT+IFRuVd9TyoP1xy5U/NVglDV9nLN5ZAfEaeQdH5swccb+wh9i5eOXxU/AZZuLth5ECVsDtuyQQ==
X-Received: by 2002:a05:620a:c46:b0:7a9:b3a0:84a7 with SMTP id af79cd13be357-7ae37822053mr2203753785a.12.1727710818027;
        Mon, 30 Sep 2024 08:40:18 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377f09bcsm421855985a.65.2024.09.30.08.40.17
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 08:40:17 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4582fa01090so536191cf.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 08:40:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzuDtj/scgxC04ru3dErYRnI2y8h/DijqSxmck67bVCDHsvtH2yJbzqHgb/McRamc8PF5wlipfLFpCqqY=@lists.ozlabs.org
X-Received: by 2002:a05:6e02:1383:b0:39e:68d8:2891 with SMTP id
 e9e14a558f8ab-3a35e53e6a9mr350535ab.6.1727710505990; Mon, 30 Sep 2024
 08:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
 <20240930122157.GF31662@pendragon.ideasonboard.com> <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
In-Reply-To: <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 1 Oct 2024 00:34:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AZhdZkaM=mVqmKY-uTuGrVUnpaTWTvOqUyOKLDS6LSKg@mail.gmail.com>
Message-ID: <CAAFQd5AZhdZkaM=mVqmKY-uTuGrVUnpaTWTvOqUyOKLDS6LSKg@mail.gmail.com>
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
To: Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 01 Oct 2024 08:45:20 +1000
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
Cc: imx@lists.linux.dev, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sean Young <sean@mess.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, linux-aspeed@lists.ozlabs.org, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Kozlov <serjk@netup.ru>, Maxim Levitsky <maximlevitsky@gmail.com>, Patrick Boettcher <patrick.boettcher@posteo.de>, Mike Isely <isely@pobox.com>, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, Olli Salonen <olli.salonen@iki.fi>, Bingbu Cao <bingbu.cao@intel.com>, Tim Harvey <tharvey@gateworks.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>, Jemma Denson <jdenson@gmail.com>, Michal Simek <michal.simek@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Andy Walls <awalls@md.metrocast.net>, Zhou Peng <eagle.zhou@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 30, 2024 at 9:38=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 30/09/2024 14:21, Laurent Pinchart wrote:
> > Hi Ricardo,
> >
> > On Mon, Sep 30, 2024 at 12:03:55PM +0000, Ricardo Ribalda wrote:
> >> include/linux/string_choices.h contains a set of helpers that can be
> >> used instead of hard coding some strings.
> >>
> >> Cocci has located some places where the helpers can be used. This
> >> patchset uses the diff generated by cocci, plus these changes:
> >
> > Personally I think most of those helpers just hinder readability for no=
t
> > much added gain. String de-duplication is done by the linker already.
> > The only value I see in the helpers is ensuring that the strings are
> > consistently written, and I think we can do so through other means.
>
> Just my opinion: I'm OK with these new helpers, but I am not too keen to =
apply
> all this to existing source code. I.e., for new code it is fine, but if w=
e have
> to update all drivers every time a new cocci test is added, then that wil=
l not
> scale.

+1 for avoiding applying this to existing code. It will just make it
more difficult to backport changes to stable kernels because of
meaningless conflicts.

Best,
Tomasz

>
> Note that I never ran cocci in my build scripts, so this is a new check t=
hat
> we haven't set rules for or have much experience with.
>
> checkpatch just checks the patches, it doesn't force you to fix existing =
code.
>
> Some of the cocci tests are clearly checking for incorrect code, but othe=
rs are
> for code improvements (i.e. the code was correct, it can just be done sli=
ghtly
> better). It's the second category were I think that should only apply to =
new code,
> and not existing code.
>
> Regards,
>
>         Hans
>
> >
> >> diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb=
-frontends/ascot2e.c
> >> index 8c3eb5d69dda..ec7a718428fc 100644
> >> --- a/drivers/media/dvb-frontends/ascot2e.c
> >> +++ b/drivers/media/dvb-frontends/ascot2e.c
> >> @@ -104,7 +104,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv =
*priv,
> >>                               u8 reg, u8 write, const u8 *data, u32 le=
n)
> >>  {
> >>         dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n=
",
> >> -               str_read_write(write =3D=3D 0), reg, len);
> >> +               str_write_read(write), reg, len);
> >>         print_hex_dump_bytes("ascot2e: I2C data: ",
> >>                 DUMP_PREFIX_OFFSET, data, len);
> >>  }
> >> diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/d=
vb-frontends/cxd2841er.c
> >> index db684f314b47..d1b84cd9c510 100644
> >> --- a/drivers/media/dvb-frontends/cxd2841er.c
> >> +++ b/drivers/media/dvb-frontends/cxd2841er.c
> >> @@ -206,7 +206,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_p=
riv *priv,
> >>  {
> >>         dev_dbg(&priv->i2c->dev,
> >>                 "cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %=
*ph\n",
> >> -               str_read_write(write =3D=3D 0), addr, reg, len, len, d=
ata);
> >> +               str_write_read(write), addr, reg, len, len, data);
> >>  }
> >>
> >>  static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
> >> diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-=
frontends/helene.c
> >> index 52198cb49dba..b4527c141d9c 100644
> >> --- a/drivers/media/dvb-frontends/helene.c
> >> +++ b/drivers/media/dvb-frontends/helene.c
> >> @@ -279,7 +279,7 @@ static void helene_i2c_debug(struct helene_priv *p=
riv,
> >>                 u8 reg, u8 write, const u8 *data, u32 len)
> >>  {
> >>         dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n"=
,
> >> -                       str_read_write(write =3D=3D 0), reg, len);
> >> +                       str_write_read(write), reg, len);
> >>         print_hex_dump_bytes("helene: I2C data: ",
> >>                         DUMP_PREFIX_OFFSET, data, len);
> >>  }
> >> diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb=
-frontends/horus3a.c
> >> index 84385079918c..10300ebf3ca0 100644
> >> --- a/drivers/media/dvb-frontends/horus3a.c
> >> +++ b/drivers/media/dvb-frontends/horus3a.c
> >> @@ -38,7 +38,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *p=
riv,
> >>                               u8 reg, u8 write, const u8 *data, u32 le=
n)
> >>  {
> >>         dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n=
",
> >> -               str_read_write(write =3D=3D 0), reg, len);
> >> +               str_write_read(write), reg, len);
> >>         print_hex_dump_bytes("horus3a: I2C data: ",
> >>                 DUMP_PREFIX_OFFSET, data, len);
> >>  }
> >> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
> >> index ba174aa45afa..a43479c3ff03 100644
> >> --- a/drivers/media/i2c/adv7842.c
> >> +++ b/drivers/media/i2c/adv7842.c
> >> @@ -2763,7 +2763,7 @@ static int adv7842_cp_log_status(struct v4l2_sub=
dev *sd)
> >>                           str_true_false(io_read(sd, 0x6a) & 0x10));
> >>         }
> >>         v4l2_info(sd, "CP free run: %s\n",
> >> -                 str_on_off(!!(cp_read(sd, 0xff) & 0x10)));
> >> +                 str_on_off(cp_read(sd, 0xff) & 0x10));
> >>         v4l2_info(sd, "Prim-mode =3D 0x%x, video std =3D 0x%x, v_freq =
=3D 0x%x\n",
> >>                   io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
> >>                   (io_read(sd, 0x01) & 0x70) >> 4);
> >> diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media=
/pci/saa7134/saa7134-cards.c
> >> index 301b89e799d8..79cd61fb0205 100644
> >> --- a/drivers/media/pci/saa7134/saa7134-cards.c
> >> +++ b/drivers/media/pci/saa7134/saa7134-cards.c
> >> @@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
> >>                         rc =3D i2c_transfer(&dev->i2c_adap, &msg, 1);
> >>                         pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n"=
,
> >>                                    dev->name, msg.addr,
> >> -                                  str_yes_no(1 =3D=3D rc));
> >> +                                  str_yes_no(rc =3D=3D 1));
> >>                         if (rc =3D=3D 1)
> >>                                 dev->has_remote =3D SAA7134_REMOTE_I2C=
;
> >>                 }
> >> diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media=
/pci/saa7134/saa7134-input.c
> >> index 90837ec6e70f..239f0b9d080a 100644
> >> --- a/drivers/media/pci/saa7134/saa7134-input.c
> >> +++ b/drivers/media/pci/saa7134/saa7134-input.c
> >> @@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
> >>                 rc =3D i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
> >>                 input_dbg("probe 0x%02x @ %s: %s\n",
> >>                         msg_msi.addr, dev->i2c_adap.name,
> >> -                       str_yes_no(1 =3D=3D rc));
> >> +                       str_yes_no(rc =3D=3D 1));
> >>                 break;
> >>         case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
> >>                 dev->init_data.name =3D "SnaZio* TVPVR PRO";
> >> @@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
> >>                 rc =3D i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
> >>                 input_dbg("probe 0x%02x @ %s: %s\n",
> >>                         msg_msi.addr, dev->i2c_adap.name,
> >> -                       str_yes_no(1 =3D=3D rc));
> >> +                       str_yes_no(rc =3D=3D 1));
> >>                 break;
> >>         case SAA7134_BOARD_HAUPPAUGE_HVR1110:
> >>                 dev->init_data.name =3D saa7134_boards[dev->board].nam=
e;
> >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/=
usb/pvrusb2/pvrusb2-ctrl.c
> >> index 448c40caf363..b6c9bda214c8 100644
> >> --- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> >> @@ -521,7 +521,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ct=
rl *cptr,
> >>                 *len =3D scnprintf(buf,maxlen,"%d",val);
> >>                 ret =3D 0;
> >>         } else if (cptr->info->type =3D=3D pvr2_ctl_bool) {
> >> -               *len =3D scnprintf(buf,maxlen,"%s",str_true_false(val)=
);
> >> +               *len =3D scnprintf(buf, maxlen, "%s", str_true_false(v=
al));
> >>                 ret =3D 0;
> >>         } else if (cptr->info->type =3D=3D pvr2_ctl_enum) {
> >>                 const char * const *names;
> >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/u=
sb/pvrusb2/pvrusb2-hdw.c
> >> index 96d3a0045fac..761d718478ca 100644
> >> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >> @@ -338,7 +338,7 @@ static void trace_stbit(const char *name,int val)
> >>  {
> >>         pvr2_trace(PVR2_TRACE_STBITS,
> >>                    "State bit %s <-- %s",
> >> -                  name,str_true_false(val));
> >> +                  name, str_true_false(val));
> >>  }
> >>
> >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >> Ricardo Ribalda (45):
> >>       media: staging: ipu3: Use string_choices helpers
> >>       media: staging: atomisp: Use string_choices helpers
> >>       media: core: Use string_choices helpers
> >>       media: pwc-ctl: Use string_choices helpers
> >>       media: pvrusb2:Use string_choices helpers
> >>       media: em28xx: Use string_choices helpers
> >>       media: dvb-usb: Use string_choices helpers
> >>       media: dvb-usb-v2: Use string_choices helpers
> >>       media: cx231xx: Use string_choices helpers
> >>       media: tuners: Use string_choices helpers
> >>       media: rc: Use string_choices helpers
> >>       media: dvb-frontends: Use string_choices helpers
> >>       media: pci: cx23885: Use string_choices helpers
> >>       media: saa7134: Use string_choices helpers
> >>       media: amphion: Use string_choices helpers
> >>       media: pci: ivtv: Use string_choices helpers
> >>       media: bttv: Use string_choices helpers
> >>       media: xilinx: Use string_choices helpers
> >>       media: platform: ti: Use string_choices helpers
> >>       media: st: Use string_choices helpers
> >>       media: coda: Use string_choices helpers
> >>       media: aspeed: Use string_choices helpers
> >>       media: ipu6: Use string_choices helpers
> >>       media: cx18: Use string_choices helpers
> >>       media: cobalt: Use string_choices helpers
> >>       media: videobuf2: Use string_choices helpers
> >>       media: cec: Use string_choices helpers
> >>       media: b2c2: Use string_choices helpers
> >>       media: siano: Use string_choices helpers
> >>       media: i2c: cx25840: Use string_choices helpers
> >>       media: i2c: vpx3220: Use string_choices helpers
> >>       media: i2c: tvp7002: Use string_choices helpers
> >>       media: i2c: ths8200: Use string_choices helpers
> >>       media: i2c: tda1997x: Use string_choices helpers
> >>       media: i2c: tc358743: Use string_choices helpers
> >>       media: i2c: st-mipid02: Use string_choices helpers
> >>       media: i2c: msp3400: Use string_choices helpers
> >>       media: i2c: max9286: Use string_choices helpers
> >>       media: i2c: saa717x: Use string_choices helpers
> >>       media: i2c: saa7127: Use string_choices helpers
> >>       media: i2c: saa7115: Use string_choices helpers
> >>       media: i2c: saa7110: Use string_choices helpers
> >>       media: i2c: adv7842: Use string_choices helpers
> >>       media: i2c: adv76xx: Use string_choices helpers
> >>       media: i2c: adv7511: Use string_choices helpers
> >>
> >>  drivers/media/cec/platform/cec-gpio/cec-gpio.c     |  4 +-
> >>  drivers/media/cec/usb/pulse8/pulse8-cec.c          |  4 +-
> >>  drivers/media/common/b2c2/flexcop-hw-filter.c      |  4 +-
> >>  drivers/media/common/siano/sms-cards.c             |  3 +-
> >>  drivers/media/common/videobuf2/videobuf2-core.c    |  5 ++-
> >>  drivers/media/dvb-frontends/ascot2e.c              |  2 +-
> >>  drivers/media/dvb-frontends/cx24120.c              |  4 +-
> >>  drivers/media/dvb-frontends/cxd2841er.c            |  2 +-
> >>  drivers/media/dvb-frontends/drxk_hard.c            |  4 +-
> >>  drivers/media/dvb-frontends/helene.c               |  2 +-
> >>  drivers/media/dvb-frontends/horus3a.c              |  2 +-
> >>  drivers/media/dvb-frontends/sp2.c                  |  2 +-
> >>  drivers/media/i2c/adv7511-v4l2.c                   | 11 +++---
> >>  drivers/media/i2c/adv7604.c                        | 25 ++++++------
> >>  drivers/media/i2c/adv7842.c                        | 40 ++++++++++---=
-------
> >>  drivers/media/i2c/cx25840/cx25840-core.c           |  4 +-
> >>  drivers/media/i2c/cx25840/cx25840-ir.c             | 34 ++++++++-----=
----
> >>  drivers/media/i2c/max9286.c                        |  2 +-
> >>  drivers/media/i2c/msp3400-driver.c                 |  4 +-
> >>  drivers/media/i2c/saa7110.c                        |  2 +-
> >>  drivers/media/i2c/saa7115.c                        |  2 +-
> >>  drivers/media/i2c/saa7127.c                        | 15 +++++---
> >>  drivers/media/i2c/saa717x.c                        |  2 +-
> >>  drivers/media/i2c/st-mipid02.c                     |  2 +-
> >>  drivers/media/i2c/tc358743.c                       | 44 ++++++++++---=
---------
> >>  drivers/media/i2c/tda1997x.c                       |  6 +--
> >>  drivers/media/i2c/ths8200.c                        |  4 +-
> >>  drivers/media/i2c/tvp7002.c                        |  2 +-
> >>  drivers/media/i2c/vpx3220.c                        |  2 +-
> >>  drivers/media/pci/bt8xx/bttv-cards.c               | 16 ++++----
> >>  drivers/media/pci/bt8xx/bttv-driver.c              |  6 +--
> >>  drivers/media/pci/cobalt/cobalt-driver.c           |  2 +-
> >>  drivers/media/pci/cx18/cx18-av-core.c              |  4 +-
> >>  drivers/media/pci/cx23885/altera-ci.c              |  2 +-
> >>  drivers/media/pci/cx23885/cimax2.c                 |  2 +-
> >>  drivers/media/pci/cx23885/cx23888-ir.c             | 36 +++++++++----=
-----
> >>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  2 +-
> >>  drivers/media/pci/ivtv/ivtvfb.c                    |  4 +-
> >>  drivers/media/pci/saa7134/saa7134-cards.c          |  2 +-
> >>  drivers/media/pci/saa7134/saa7134-dvb.c            |  2 +-
> >>  drivers/media/pci/saa7134/saa7134-input.c          |  6 +--
> >>  drivers/media/pci/saa7134/saa7134-video.c          |  2 +-
> >>  drivers/media/platform/amphion/venc.c              |  2 +-
> >>  drivers/media/platform/amphion/vpu_dbg.c           |  2 +-
> >>  drivers/media/platform/aspeed/aspeed-video.c       |  4 +-
> >>  drivers/media/platform/chips-media/coda/imx-vdoa.c |  3 +-
> >>  drivers/media/platform/st/sti/hva/hva-debugfs.c    |  6 +--
> >>  drivers/media/platform/ti/omap3isp/ispstat.c       |  2 +-
> >>  drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 18 ++++-----
> >>  drivers/media/rc/ene_ir.c                          |  3 +-
> >>  drivers/media/rc/mceusb.c                          |  3 +-
> >>  drivers/media/rc/serial_ir.c                       |  5 ++-
> >>  drivers/media/tuners/tda18250.c                    |  2 +-
> >>  drivers/media/tuners/tda9887.c                     | 10 ++---
> >>  drivers/media/usb/cx231xx/cx231xx-i2c.c            |  4 +-
> >>  drivers/media/usb/cx231xx/cx231xx-video.c          |  2 +-
> >>  drivers/media/usb/dvb-usb-v2/az6007.c              |  4 +-
> >>  drivers/media/usb/dvb-usb-v2/dvb_usb_core.c        |  4 +-
> >>  drivers/media/usb/dvb-usb/af9005-fe.c              |  4 +-
> >>  drivers/media/usb/dvb-usb/dvb-usb-dvb.c            |  6 +--
> >>  drivers/media/usb/dvb-usb/opera1.c                 |  8 ++--
> >>  drivers/media/usb/em28xx/em28xx-i2c.c              |  4 +-
> >>  drivers/media/usb/em28xx/em28xx-video.c            |  2 +-
> >>  drivers/media/usb/pvrusb2/pvrusb2-ctrl.c           |  2 +-
> >>  drivers/media/usb/pvrusb2/pvrusb2-debugifc.c       |  3 +-
> >>  drivers/media/usb/pvrusb2/pvrusb2-encoder.c        |  5 +--
> >>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |  6 +--
> >>  drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c       |  3 +-
> >>  drivers/media/usb/pwc/pwc-ctrl.c                   |  2 +-
> >>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +-
> >>  drivers/media/v4l2-core/v4l2-fwnode.c              | 12 +++---
> >>  .../media/atomisp/pci/atomisp_compat_css20.c       |  2 +-
> >>  .../media/atomisp/pci/atomisp_csi2_bridge.c        |  2 +-
> >>  .../media/atomisp/pci/atomisp_gmin_platform.c      |  4 +-
> >>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  4 +-
> >>  .../media/atomisp/pci/runtime/binary/src/binary.c  |  2 +-
> >>  drivers/staging/media/atomisp/pci/sh_css.c         |  2 +-
> >>  drivers/staging/media/ipu3/ipu3-v4l2.c             |  4 +-
> >>  78 files changed, 240 insertions(+), 239 deletions(-)
> >> ---
> >> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> >> change-id: 20240930-cocci-opportunity-40bca6a17c42
> >
>
