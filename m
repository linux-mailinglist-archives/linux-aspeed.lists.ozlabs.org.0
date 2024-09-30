Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B298B063
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkr1Zlzz3vYC
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=38.111.141.201
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727701244;
	cv=none; b=IIGB/9w0JJKFUfE1Bbi/JZ7AX5OWrMdOeo29UsHFDFN4jPYYgb1u33ul5TnEK51K8cKgnMnFeOenD1qAwmgSP2+Wtx4wRxCaEtGze6KqepzyokDMLK9iAzDX1YG606oqFxtQkYkSB32Ul9gEUKvp3lqhjGJwGWFKyGfNube65hhVni5W6MWcxO1CwmK86dG/vQhlqZiy1UntaBflXl58dV2lS0HZC/7PXAa8Y1mDAxTb3+t/aSub+rDTahgh2+YzpVTW+ZksW1hua4cWeKnQO4W0hDml4vCk2wyHMBssLR5xjhy5gOU3TXSNLcTBd9NijxL4sbztsw0M9kp+gbsJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727701244; c=relaxed/relaxed;
	bh=bEWivP59UFWIVOMOjtMkQZPQ7r7iFa1yFz2TiI1f3x0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=BLYhSLJJJh5PR1c2QqhiMSPn33Z2qmQm8s1JZWbidGZ7H5eyhBj4C9gZGoaL3E2pZhlcU1Xw34Pd50oEp4R+8VYF1QKDBiRhp6pKizAuaNz+1+cIIU5ZC8j+iDmZIcca/gIL7u//uzyxSfMZpuXj3jCgC/Pf1FDaeDxy3vqUVBxzqdhbvebmDL7weO9XjTQlZn/a3PErX7+iZ+zZTJ/TWu4dUwaOJI9nzzWK8seR07nHy7Ey1yHt+K5EPcMPdZktGxo/YRfSOZ8URudluaUXpSw+ezQZRXAqxnsXU/YcshuB+Hv4EUflX23dbZNCFnI7+DWvOb3ewJGmEPdINVFhIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=md.metrocast.net; dkim=pass (1024-bit key; unprotected) header.d=echolabs.net header.i=@echolabs.net header.a=rsa-sha256 header.s=outbound header.b=2hyMVH8y; dkim-atps=neutral; spf=pass (client-ip=38.111.141.201; helo=outbound1.echolabs.net; envelope-from=awalls@md.metrocast.net; receiver=lists.ozlabs.org) smtp.mailfrom=md.metrocast.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=md.metrocast.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=echolabs.net header.i=@echolabs.net header.a=rsa-sha256 header.s=outbound header.b=2hyMVH8y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=md.metrocast.net (client-ip=38.111.141.201; helo=outbound1.echolabs.net; envelope-from=awalls@md.metrocast.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 115 seconds by postgrey-1.37 at boromir; Mon, 30 Sep 2024 23:00:39 AEST
Received: from OUTBOUND1.ECHOLABS.NET (outbound1.echolabs.net [38.111.141.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHLlq6FTPz2xCp;
	Mon, 30 Sep 2024 23:00:39 +1000 (AEST)
Received: from cluster1.echolabs.net ([10.0.1.2])
	by cmsmtp with ESMTP
	id vFyZsPoghGwCmvFyZsWxwm; Mon, 30 Sep 2024 08:58:07 -0400
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.4 cv=cKRDsUeN c=1 sm=1 tr=0 ts=66faa0f6 cx=a_idp_x
 a=deaM/syu8nPsmUxY89PwZA==:117 a=dHwet71K7hIblIhzQqIuGw==:17
 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=xOd6jRPJAAAA:8 a=cm27Pg_UAAAA:8
 a=s7bhVaM4XrlkExUdx14A:9 a=QEXdDO2ut3YA:10
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 29
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.4 cv=cKRDsUeN c=1 sm=1 tr=0 ts=66faa0b2 cx=a_idp_x
 a=deaM/syu8nPsmUxY89PwZA==:117 a=dHwet71K7hIblIhzQqIuGw==:17
 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=xOd6jRPJAAAA:8 a=cm27Pg_UAAAA:8
 a=s7bhVaM4XrlkExUdx14A:9 a=QEXdDO2ut3YA:10
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=echolabs.net;
	s=outbound; t=1727701087;
	bh=bEWivP59UFWIVOMOjtMkQZPQ7r7iFa1yFz2TiI1f3x0=; h=X-ELOB-ID:From;
	b=2hyMVH8yvZb6CUAnRXAJpDYGJPUUoTtXOkS+MGnDpTwOaU3yJqLIvQgybGG7pgj8p
	 zjOfIEwRWIFceEUUefazJ/77I050TmiqxWQkDAkOZ6EDpnvoVCwUBV0hL+OcByfqy/
	 hMa4WGY9dmUWQuL7Bma0RLQoUAr/apa6f8f4Rr1k=
X-ELOB-ID: <20240930085807-vFyZsPoghGwCmvFyZsWxwm-OUTBOUND1.ECHOLABS.NET@echolabs.net>
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.4 cv=cKRDsUeN c=1 sm=1 tr=0 ts=66faa05f cx=a_idp_x
 a=deaM/syu8nPsmUxY89PwZA==:117 a=dHwet71K7hIblIhzQqIuGw==:17
 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=xOd6jRPJAAAA:8 a=cm27Pg_UAAAA:8
 a=s7bhVaM4XrlkExUdx14A:9 a=QEXdDO2ut3YA:10
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 32
Received: from [10.0.0.92] (HELO MX02.MAIL.ECHOLABS.NET)
  by echolabs.net (CommuniGate Pro SMTP 7.0.2)
  with ESMTP id 1443219067; Mon, 30 Sep 2024 08:58:07 -0400
Received: from [127.0.0.1] ([74.214.59.219])
	by Echo Labs with ESMTPA
	id vFyCsUy1dVHiHvFyXsN8sw; Mon, 30 Sep 2024 08:58:07 -0400
X-SS: 100
X-GEO: US US
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.4 cv=c+YIQg9l c=1 sm=1 tr=0 ts=66faa05f
 a=dHwet71K7hIblIhzQqIuGw==:117 a=dHwet71K7hIblIhzQqIuGw==:17
 a=IkcTkHD0fZMA:10 a=xOd6jRPJAAAA:8 a=cm27Pg_UAAAA:8 a=s7bhVaM4XrlkExUdx14A:9
 a=QEXdDO2ut3YA:10
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 44
X-AUTH-ID: awalls@md.metrocast.net
Date: Mon, 30 Sep 2024 08:57:44 -0400
From: Andy Walls <awalls@md.metrocast.net>
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
User-Agent: K-9 Mail for Android
In-Reply-To: <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org> <20240930122157.GF31662@pendragon.ideasonboard.com> <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
Message-ID: <7D358236-19F8-4F94-89A0-F379F193971F@md.metrocast.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CMAE-Envelope: MS4xfBYwDXVR6hfDErCvTkbyP4wCPG/2e6QnrOEoTeCT1Gs4dGKI52kb0VBeXWh2ikSDVmODh/fE919l7Lx61lunPCY4FfQWG/ThgFRNPVSyBAcH9uiXDDYY
 ghaaauA4zzfuykLy44TVQLRbMb1HUvlRWts4EmZoARJ6NH10dylIDyNpj961ZXucy+RdZUbVQa8fziJd7H4ld8YZLvdAueFwlfgVS3PUsqKYyBSgbBAVMFYJ
 SPvrs87VzWn0hVOPFyE6yQ==
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: imx@lists.linux.dev, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sean Young <sean@mess.org>, Fabio Estevam <festevam@gmail.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, linux-aspeed@lists.ozlabs.org, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Kozlov <serjk@netup.ru>, Maxim Levitsky <maximlevitsky@gmail.com>, Patrick Boettcher <patrick.boettcher@posteo.de>, Mike Isely <isely@pobox.com>, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, Olli Salonen <olli.salonen@iki.fi>, Bingbu Cao <bingbu.cao@intel.com>, Tim Harvey <tharvey@gateworks.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>, Jemma Denson <jdenson@gmail.com>, Michal Simek <michal.simek@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>, =?ISO-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Zhou Peng <eagle.zhou@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On September 30, 2024 8:38:22 AM EDT, Hans Verkuil <hverkuil@xs4all=2Enl> w=
rote:
>On 30/09/2024 14:21, Laurent Pinchart wrote:
>> Hi Ricardo,
>>=20
>> On Mon, Sep 30, 2024 at 12:03:55PM +0000, Ricardo Ribalda wrote:
>>> include/linux/string_choices=2Eh contains a set of helpers that can be
>>> used instead of hard coding some strings=2E
>>>
>>> Cocci has located some places where the helpers can be used=2E This
>>> patchset uses the diff generated by cocci, plus these changes:
>>=20
>> Personally I think most of those helpers just hinder readability for no=
t
>> much added gain=2E String de-duplication is done by the linker already=
=2E
>> The only value I see in the helpers is ensuring that the strings are
>> consistently written, and I think we can do so through other means=2E
>
>Just my opinion: I'm OK with these new helpers, but I am not too keen to =
apply
>all this to existing source code=2E I=2Ee=2E, for new code it is fine, bu=
t if we have
>to update all drivers every time a new cocci test is added, then that wil=
l not
>scale=2E
>
>Note that I never ran cocci in my build scripts, so this is a new check t=
hat
>we haven't set rules for or have much experience with=2E
>
>checkpatch just checks the patches, it doesn't force you to fix existing =
code=2E
>
>Some of the cocci tests are clearly checking for incorrect code, but othe=
rs are
>for code improvements (i=2Ee=2E the code was correct, it can just be done=
 slightly
>better)=2E It's the second category were I think that should only apply t=
o new code,
>and not existing code=2E
>
>Regards,
>
>	Hans
>
>>=20
>>> diff --git a/drivers/media/dvb-frontends/ascot2e=2Ec b/drivers/media/d=
vb-frontends/ascot2e=2Ec
>>> index 8c3eb5d69dda=2E=2Eec7a718428fc 100644
>>> --- a/drivers/media/dvb-frontends/ascot2e=2Ec
>>> +++ b/drivers/media/dvb-frontends/ascot2e=2Ec
>>> @@ -104,7 +104,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv =
*priv,
>>>                               u8 reg, u8 write, const u8 *data, u32 le=
n)
>>>  {
>>>         dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n=
",
>>> -               str_read_write(write =3D=3D 0), reg, len);
>>> +               str_write_read(write), reg, len);
>>>         print_hex_dump_bytes("ascot2e: I2C data: ",
>>>                 DUMP_PREFIX_OFFSET, data, len);
>>>  }
>>> diff --git a/drivers/media/dvb-frontends/cxd2841er=2Ec b/drivers/media=
/dvb-frontends/cxd2841er=2Ec
>>> index db684f314b47=2E=2Ed1b84cd9c510 100644
>>> --- a/drivers/media/dvb-frontends/cxd2841er=2Ec
>>> +++ b/drivers/media/dvb-frontends/cxd2841er=2Ec
>>> @@ -206,7 +206,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_p=
riv *priv,
>>>  {
>>>         dev_dbg(&priv->i2c->dev,
>>>                 "cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %=
*ph\n",
>>> -               str_read_write(write =3D=3D 0), addr, reg, len, len, d=
ata);
>>> +               str_write_read(write), addr, reg, len, len, data);
>>>  }
>>> =20
>>>  static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
>>> diff --git a/drivers/media/dvb-frontends/helene=2Ec b/drivers/media/dv=
b-frontends/helene=2Ec
>>> index 52198cb49dba=2E=2Eb4527c141d9c 100644
>>> --- a/drivers/media/dvb-frontends/helene=2Ec
>>> +++ b/drivers/media/dvb-frontends/helene=2Ec
>>> @@ -279,7 +279,7 @@ static void helene_i2c_debug(struct helene_priv *p=
riv,
>>>                 u8 reg, u8 write, const u8 *data, u32 len)
>>>  {
>>>         dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n"=
,
>>> -                       str_read_write(write =3D=3D 0), reg, len);
>>> +                       str_write_read(write), reg, len);
>>>         print_hex_dump_bytes("helene: I2C data: ",
>>>                         DUMP_PREFIX_OFFSET, data, len);
>>>  }
>>> diff --git a/drivers/media/dvb-frontends/horus3a=2Ec b/drivers/media/d=
vb-frontends/horus3a=2Ec
>>> index 84385079918c=2E=2E10300ebf3ca0 100644
>>> --- a/drivers/media/dvb-frontends/horus3a=2Ec
>>> +++ b/drivers/media/dvb-frontends/horus3a=2Ec
>>> @@ -38,7 +38,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *p=
riv,
>>>                               u8 reg, u8 write, const u8 *data, u32 le=
n)
>>>  {
>>>         dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n=
",
>>> -               str_read_write(write =3D=3D 0), reg, len);
>>> +               str_write_read(write), reg, len);
>>>         print_hex_dump_bytes("horus3a: I2C data: ",
>>>                 DUMP_PREFIX_OFFSET, data, len);
>>>  }
>>> diff --git a/drivers/media/i2c/adv7842=2Ec b/drivers/media/i2c/adv7842=
=2Ec
>>> index ba174aa45afa=2E=2Ea43479c3ff03 100644
>>> --- a/drivers/media/i2c/adv7842=2Ec
>>> +++ b/drivers/media/i2c/adv7842=2Ec
>>> @@ -2763,7 +2763,7 @@ static int adv7842_cp_log_status(struct v4l2_sub=
dev *sd)
>>>                           str_true_false(io_read(sd, 0x6a) & 0x10));
>>>         }
>>>         v4l2_info(sd, "CP free run: %s\n",
>>> -                 str_on_off(!!(cp_read(sd, 0xff) & 0x10)));
>>> +                 str_on_off(cp_read(sd, 0xff) & 0x10));
>>>         v4l2_info(sd, "Prim-mode =3D 0x%x, video std =3D 0x%x, v_freq =
=3D 0x%x\n",
>>>                   io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
>>>                   (io_read(sd, 0x01) & 0x70) >> 4);
>>> diff --git a/drivers/media/pci/saa7134/saa7134-cards=2Ec b/drivers/med=
ia/pci/saa7134/saa7134-cards=2Ec
>>> index 301b89e799d8=2E=2E79cd61fb0205 100644
>>> --- a/drivers/media/pci/saa7134/saa7134-cards=2Ec
>>> +++ b/drivers/media/pci/saa7134/saa7134-cards=2Ec
>>> @@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
>>>                         rc =3D i2c_transfer(&dev->i2c_adap, &msg, 1);
>>>                         pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n"=
,
>>>                                    dev->name, msg=2Eaddr,
>>> -                                  str_yes_no(1 =3D=3D rc));
>>> +                                  str_yes_no(rc =3D=3D 1));
>>>                         if (rc =3D=3D 1)
>>>                                 dev->has_remote =3D SAA7134_REMOTE_I2C=
;
>>>                 }
>>> diff --git a/drivers/media/pci/saa7134/saa7134-input=2Ec b/drivers/med=
ia/pci/saa7134/saa7134-input=2Ec
>>> index 90837ec6e70f=2E=2E239f0b9d080a 100644
>>> --- a/drivers/media/pci/saa7134/saa7134-input=2Ec
>>> +++ b/drivers/media/pci/saa7134/saa7134-input=2Ec
>>> @@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
>>>                 rc =3D i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
>>>                 input_dbg("probe 0x%02x @ %s: %s\n",
>>>                         msg_msi=2Eaddr, dev->i2c_adap=2Ename,
>>> -                       str_yes_no(1 =3D=3D rc));
>>> +                       str_yes_no(rc =3D=3D 1));
>>>                 break;
>>>         case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
>>>                 dev->init_data=2Ename =3D "SnaZio* TVPVR PRO";
>>> @@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
>>>                 rc =3D i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
>>>                 input_dbg("probe 0x%02x @ %s: %s\n",
>>>                         msg_msi=2Eaddr, dev->i2c_adap=2Ename,
>>> -                       str_yes_no(1 =3D=3D rc));
>>> +                       str_yes_no(rc =3D=3D 1));
>>>                 break;
>>>         case SAA7134_BOARD_HAUPPAUGE_HVR1110:
>>>                 dev->init_data=2Ename =3D saa7134_boards[dev->board]=
=2Ename;
>>> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl=2Ec b/drivers/medi=
a/usb/pvrusb2/pvrusb2-ctrl=2Ec
>>> index 448c40caf363=2E=2Eb6c9bda214c8 100644
>>> --- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl=2Ec
>>> +++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl=2Ec
>>> @@ -521,7 +521,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ct=
rl *cptr,
>>>                 *len =3D scnprintf(buf,maxlen,"%d",val);
>>>                 ret =3D 0;
>>>         } else if (cptr->info->type =3D=3D pvr2_ctl_bool) {
>>> -               *len =3D scnprintf(buf,maxlen,"%s",str_true_false(val)=
);
>>> +               *len =3D scnprintf(buf, maxlen, "%s", str_true_false(v=
al));
>>>                 ret =3D 0;
>>>         } else if (cptr->info->type =3D=3D pvr2_ctl_enum) {
>>>                 const char * const *names;
>>> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw=2Ec b/drivers/media=
/usb/pvrusb2/pvrusb2-hdw=2Ec
>>> index 96d3a0045fac=2E=2E761d718478ca 100644
>>> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw=2Ec
>>> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw=2Ec
>>> @@ -338,7 +338,7 @@ static void trace_stbit(const char *name,int val)
>>>  {
>>>         pvr2_trace(PVR2_TRACE_STBITS,
>>>                    "State bit %s <-- %s",
>>> -                  name,str_true_false(val));
>>> +                  name, str_true_false(val));
>>>  }
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium=2Eorg>
>>> ---
>>> Ricardo Ribalda (45):
>>>       media: staging: ipu3: Use string_choices helpers
>>>       media: staging: atomisp: Use string_choices helpers
>>>       media: core: Use string_choices helpers
>>>       media: pwc-ctl: Use string_choices helpers
>>>       media: pvrusb2:Use string_choices helpers
>>>       media: em28xx: Use string_choices helpers
>>>       media: dvb-usb: Use string_choices helpers
>>>       media: dvb-usb-v2: Use string_choices helpers
>>>       media: cx231xx: Use string_choices helpers
>>>       media: tuners: Use string_choices helpers
>>>       media: rc: Use string_choices helpers
>>>       media: dvb-frontends: Use string_choices helpers
>>>       media: pci: cx23885: Use string_choices helpers
>>>       media: saa7134: Use string_choices helpers
>>>       media: amphion: Use string_choices helpers
>>>       media: pci: ivtv: Use string_choices helpers
>>>       media: bttv: Use string_choices helpers
>>>       media: xilinx: Use string_choices helpers
>>>       media: platform: ti: Use string_choices helpers
>>>       media: st: Use string_choices helpers
>>>       media: coda: Use string_choices helpers
>>>       media: aspeed: Use string_choices helpers
>>>       media: ipu6: Use string_choices helpers
>>>       media: cx18: Use string_choices helpers
>>>       media: cobalt: Use string_choices helpers
>>>       media: videobuf2: Use string_choices helpers
>>>       media: cec: Use string_choices helpers
>>>       media: b2c2: Use string_choices helpers
>>>       media: siano: Use string_choices helpers
>>>       media: i2c: cx25840: Use string_choices helpers
>>>       media: i2c: vpx3220: Use string_choices helpers
>>>       media: i2c: tvp7002: Use string_choices helpers
>>>       media: i2c: ths8200: Use string_choices helpers
>>>       media: i2c: tda1997x: Use string_choices helpers
>>>       media: i2c: tc358743: Use string_choices helpers
>>>       media: i2c: st-mipid02: Use string_choices helpers
>>>       media: i2c: msp3400: Use string_choices helpers
>>>       media: i2c: max9286: Use string_choices helpers
>>>       media: i2c: saa717x: Use string_choices helpers
>>>       media: i2c: saa7127: Use string_choices helpers
>>>       media: i2c: saa7115: Use string_choices helpers
>>>       media: i2c: saa7110: Use string_choices helpers
>>>       media: i2c: adv7842: Use string_choices helpers
>>>       media: i2c: adv76xx: Use string_choices helpers
>>>       media: i2c: adv7511: Use string_choices helpers
>>>
>>>  drivers/media/cec/platform/cec-gpio/cec-gpio=2Ec     |  4 +-
>>>  drivers/media/cec/usb/pulse8/pulse8-cec=2Ec          |  4 +-
>>>  drivers/media/common/b2c2/flexcop-hw-filter=2Ec      |  4 +-
>>>  drivers/media/common/siano/sms-cards=2Ec             |  3 +-
>>>  drivers/media/common/videobuf2/videobuf2-core=2Ec    |  5 ++-
>>>  drivers/media/dvb-frontends/ascot2e=2Ec              |  2 +-
>>>  drivers/media/dvb-frontends/cx24120=2Ec              |  4 +-
>>>  drivers/media/dvb-frontends/cxd2841er=2Ec            |  2 +-
>>>  drivers/media/dvb-frontends/drxk_hard=2Ec            |  4 +-
>>>  drivers/media/dvb-frontends/helene=2Ec               |  2 +-
>>>  drivers/media/dvb-frontends/horus3a=2Ec              |  2 +-
>>>  drivers/media/dvb-frontends/sp2=2Ec                  |  2 +-
>>>  drivers/media/i2c/adv7511-v4l2=2Ec                   | 11 +++---
>>>  drivers/media/i2c/adv7604=2Ec                        | 25 ++++++-----=
-
>>>  drivers/media/i2c/adv7842=2Ec                        | 40 ++++++++++-=
---------
>>>  drivers/media/i2c/cx25840/cx25840-core=2Ec           |  4 +-
>>>  drivers/media/i2c/cx25840/cx25840-ir=2Ec             | 34 ++++++++---=
------
>>>  drivers/media/i2c/max9286=2Ec                        |  2 +-
>>>  drivers/media/i2c/msp3400-driver=2Ec                 |  4 +-
>>>  drivers/media/i2c/saa7110=2Ec                        |  2 +-
>>>  drivers/media/i2c/saa7115=2Ec                        |  2 +-
>>>  drivers/media/i2c/saa7127=2Ec                        | 15 +++++---
>>>  drivers/media/i2c/saa717x=2Ec                        |  2 +-
>>>  drivers/media/i2c/st-mipid02=2Ec                     |  2 +-
>>>  drivers/media/i2c/tc358743=2Ec                       | 44 ++++++++++-=
-----------
>>>  drivers/media/i2c/tda1997x=2Ec                       |  6 +--
>>>  drivers/media/i2c/ths8200=2Ec                        |  4 +-
>>>  drivers/media/i2c/tvp7002=2Ec                        |  2 +-
>>>  drivers/media/i2c/vpx3220=2Ec                        |  2 +-
>>>  drivers/media/pci/bt8xx/bttv-cards=2Ec               | 16 ++++----
>>>  drivers/media/pci/bt8xx/bttv-driver=2Ec              |  6 +--
>>>  drivers/media/pci/cobalt/cobalt-driver=2Ec           |  2 +-
>>>  drivers/media/pci/cx18/cx18-av-core=2Ec              |  4 +-
>>>  drivers/media/pci/cx23885/altera-ci=2Ec              |  2 +-
>>>  drivers/media/pci/cx23885/cimax2=2Ec                 |  2 +-
>>>  drivers/media/pci/cx23885/cx23888-ir=2Ec             | 36 +++++++++--=
-------
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2=2Ec      |  2 +-
>>>  drivers/media/pci/ivtv/ivtvfb=2Ec                    |  4 +-
>>>  drivers/media/pci/saa7134/saa7134-cards=2Ec          |  2 +-
>>>  drivers/media/pci/saa7134/saa7134-dvb=2Ec            |  2 +-
>>>  drivers/media/pci/saa7134/saa7134-input=2Ec          |  6 +--
>>>  drivers/media/pci/saa7134/saa7134-video=2Ec          |  2 +-
>>>  drivers/media/platform/amphion/venc=2Ec              |  2 +-
>>>  drivers/media/platform/amphion/vpu_dbg=2Ec           |  2 +-
>>>  drivers/media/platform/aspeed/aspeed-video=2Ec       |  4 +-
>>>  drivers/media/platform/chips-media/coda/imx-vdoa=2Ec |  3 +-
>>>  drivers/media/platform/st/sti/hva/hva-debugfs=2Ec    |  6 +--
>>>  drivers/media/platform/ti/omap3isp/ispstat=2Ec       |  2 +-
>>>  drivers/media/platform/xilinx/xilinx-csi2rxss=2Ec    | 18 ++++-----
>>>  drivers/media/rc/ene_ir=2Ec                          |  3 +-
>>>  drivers/media/rc/mceusb=2Ec                          |  3 +-
>>>  drivers/media/rc/serial_ir=2Ec                       |  5 ++-
>>>  drivers/media/tuners/tda18250=2Ec                    |  2 +-
>>>  drivers/media/tuners/tda9887=2Ec                     | 10 ++---
>>>  drivers/media/usb/cx231xx/cx231xx-i2c=2Ec            |  4 +-
>>>  drivers/media/usb/cx231xx/cx231xx-video=2Ec          |  2 +-
>>>  drivers/media/usb/dvb-usb-v2/az6007=2Ec              |  4 +-
>>>  drivers/media/usb/dvb-usb-v2/dvb_usb_core=2Ec        |  4 +-
>>>  drivers/media/usb/dvb-usb/af9005-fe=2Ec              |  4 +-
>>>  drivers/media/usb/dvb-usb/dvb-usb-dvb=2Ec            |  6 +--
>>>  drivers/media/usb/dvb-usb/opera1=2Ec                 |  8 ++--
>>>  drivers/media/usb/em28xx/em28xx-i2c=2Ec              |  4 +-
>>>  drivers/media/usb/em28xx/em28xx-video=2Ec            |  2 +-
>>>  drivers/media/usb/pvrusb2/pvrusb2-ctrl=2Ec           |  2 +-
>>>  drivers/media/usb/pvrusb2/pvrusb2-debugifc=2Ec       |  3 +-
>>>  drivers/media/usb/pvrusb2/pvrusb2-encoder=2Ec        |  5 +--
>>>  drivers/media/usb/pvrusb2/pvrusb2-hdw=2Ec            |  6 +--
>>>  drivers/media/usb/pvrusb2/pvrusb2-i2c-core=2Ec       |  3 +-
>>>  drivers/media/usb/pwc/pwc-ctrl=2Ec                   |  2 +-
>>>  drivers/media/v4l2-core/v4l2-ctrls-core=2Ec          |  3 +-
>>>  drivers/media/v4l2-core/v4l2-fwnode=2Ec              | 12 +++---
>>>  =2E=2E=2E/media/atomisp/pci/atomisp_compat_css20=2Ec       |  2 +-
>>>  =2E=2E=2E/media/atomisp/pci/atomisp_csi2_bridge=2Ec        |  2 +-
>>>  =2E=2E=2E/media/atomisp/pci/atomisp_gmin_platform=2Ec      |  4 +-
>>>  drivers/staging/media/atomisp/pci/atomisp_v4l2=2Ec   |  4 +-
>>>  =2E=2E=2E/media/atomisp/pci/runtime/binary/src/binary=2Ec  |  2 +-
>>>  drivers/staging/media/atomisp/pci/sh_css=2Ec         |  2 +-
>>>  drivers/staging/media/ipu3/ipu3-v4l2=2Ec             |  4 +-
>>>  78 files changed, 240 insertions(+), 239 deletions(-)
>>> ---
>>> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
>>> change-id: 20240930-cocci-opportunity-40bca6a17c42
>>=20
>

Hi Ricardo,

I'll go a little further than Hans and Laurent:

I staunchly oppose what I call editorial changes:

 'sed s/happy/glad/g'

in code that has been working for a long time for which many do not have t=
ime or hardware to perform regression tests against=2E

Please explain the return on investment for why this change should be appl=
ied?  Help me to understand how that return outweighs the risk of introduci=
ng a bug? (No human being really code reviews sweeping editorial change lik=
e these thoroughly=2E)

-Andy
