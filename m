Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0C098B05F
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkp6r6Wz3gMC
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727699917;
	cv=none; b=RhGXSnkobJMm3Mtto4S/89dnHu62LM37nY43ambo4F42uOzhDthQXurQXiycnBqdpW37AyAqKh/UCv1g+h7IrQyCb5qv9CctmUAQRHDbCnYiU+ayzN2kqFGDbx7Z9zfaM92sROG3BQXqU9Q+harWgCKcDGj4JFoQhSAMeKw3jyr4L9cMVebiKsAf+TYFDp5ChXAWl/q/idzO5QPN//74Qo8kV5OOUgGwcYvymYsN18dVMoQitxgDBHD1Zzl+odBPBvWTRP/tvSGzxfuV+FCyd7gFa70diSkdOstGZ68On0MhSVYSjWk+CLdoZC3MC+TPz4vhUQrtta6WQlsamCF6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727699917; c=relaxed/relaxed;
	bh=1hszZ2fvvC4MEmeRQxxOvp4VqzWk/zSj3zd3DeivbjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhM4aVTHG/MEXAAkZqpUvfMdKjPdnyojciJFLC0wBLmlrl0gKEF19FZl272YJC/QNX3Lka9vNp95eCRC0vOoDy1lLtNuBNh7yPX0Z/G/HAk1AKe6vxkjCKBBNcl9neKIP6DGqrb8JaLioeKQ+agxWhQ6F8k199nNRFqm2jE+0HEeBlgX5T99P4vbcyUH9qh4RaztAEXA2t2moZKefgNWNEIxOtI7Qoj03oxdmFe4hiAmiqX6jBdcDJuxJokNIwkbRUNS65eMiDs9qC+bWvkIaKbm09bloTkdRJk2MtikoPa+yPTEO5l6UfEyuERiqAGRgyz9uhmxlEp5SMRrAasLYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=xs4all.nl; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=67/w=q4=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=xs4all.nl
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=67/w=q4=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHLGN1pd7z2xDM;
	Mon, 30 Sep 2024 22:38:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A70B65C47B2;
	Mon, 30 Sep 2024 12:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3DDC4CEC7;
	Mon, 30 Sep 2024 12:38:24 +0000 (UTC)
Message-ID: <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
Date: Mon, 30 Sep 2024 14:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
 <20240930122157.GF31662@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240930122157.GF31662@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: imx@lists.linux.dev, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sean Young <sean@mess.org>, Fabio Estevam <festevam@gmail.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, linux-aspeed@lists.ozlabs.org, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Kozlov <serjk@netup.ru>, Maxim Levitsky <maximlevitsky@gmail.com>, Patrick Boettcher <patrick.boettcher@posteo.de>, Mike Isely <isely@pobox.com>, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, Olli Salonen <olli.salonen@iki.fi>, Bingbu Cao <bingbu.cao@intel.com>, Tim Harvey <tharvey@gateworks.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>, Jemma Denson <jdenson@gmail.com>, Michal Simek <michal.simek@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Andy Walls <awalls@md.metrocast.net>, Zhou Peng <eagle.zhou@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 30/09/2024 14:21, Laurent Pinchart wrote:
> Hi Ricardo,
> 
> On Mon, Sep 30, 2024 at 12:03:55PM +0000, Ricardo Ribalda wrote:
>> include/linux/string_choices.h contains a set of helpers that can be
>> used instead of hard coding some strings.
>>
>> Cocci has located some places where the helpers can be used. This
>> patchset uses the diff generated by cocci, plus these changes:
> 
> Personally I think most of those helpers just hinder readability for not
> much added gain. String de-duplication is done by the linker already.
> The only value I see in the helpers is ensuring that the strings are
> consistently written, and I think we can do so through other means.

Just my opinion: I'm OK with these new helpers, but I am not too keen to apply
all this to existing source code. I.e., for new code it is fine, but if we have
to update all drivers every time a new cocci test is added, then that will not
scale.

Note that I never ran cocci in my build scripts, so this is a new check that
we haven't set rules for or have much experience with.

checkpatch just checks the patches, it doesn't force you to fix existing code.

Some of the cocci tests are clearly checking for incorrect code, but others are
for code improvements (i.e. the code was correct, it can just be done slightly
better). It's the second category were I think that should only apply to new code,
and not existing code.

Regards,

	Hans

> 
>> diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
>> index 8c3eb5d69dda..ec7a718428fc 100644
>> --- a/drivers/media/dvb-frontends/ascot2e.c
>> +++ b/drivers/media/dvb-frontends/ascot2e.c
>> @@ -104,7 +104,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv *priv,
>>                               u8 reg, u8 write, const u8 *data, u32 len)
>>  {
>>         dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n",
>> -               str_read_write(write == 0), reg, len);
>> +               str_write_read(write), reg, len);
>>         print_hex_dump_bytes("ascot2e: I2C data: ",
>>                 DUMP_PREFIX_OFFSET, data, len);
>>  }
>> diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
>> index db684f314b47..d1b84cd9c510 100644
>> --- a/drivers/media/dvb-frontends/cxd2841er.c
>> +++ b/drivers/media/dvb-frontends/cxd2841er.c
>> @@ -206,7 +206,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_priv *priv,
>>  {
>>         dev_dbg(&priv->i2c->dev,
>>                 "cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %*ph\n",
>> -               str_read_write(write == 0), addr, reg, len, len, data);
>> +               str_write_read(write), addr, reg, len, len, data);
>>  }
>>  
>>  static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
>> diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
>> index 52198cb49dba..b4527c141d9c 100644
>> --- a/drivers/media/dvb-frontends/helene.c
>> +++ b/drivers/media/dvb-frontends/helene.c
>> @@ -279,7 +279,7 @@ static void helene_i2c_debug(struct helene_priv *priv,
>>                 u8 reg, u8 write, const u8 *data, u32 len)
>>  {
>>         dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n",
>> -                       str_read_write(write == 0), reg, len);
>> +                       str_write_read(write), reg, len);
>>         print_hex_dump_bytes("helene: I2C data: ",
>>                         DUMP_PREFIX_OFFSET, data, len);
>>  }
>> diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb-frontends/horus3a.c
>> index 84385079918c..10300ebf3ca0 100644
>> --- a/drivers/media/dvb-frontends/horus3a.c
>> +++ b/drivers/media/dvb-frontends/horus3a.c
>> @@ -38,7 +38,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *priv,
>>                               u8 reg, u8 write, const u8 *data, u32 len)
>>  {
>>         dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n",
>> -               str_read_write(write == 0), reg, len);
>> +               str_write_read(write), reg, len);
>>         print_hex_dump_bytes("horus3a: I2C data: ",
>>                 DUMP_PREFIX_OFFSET, data, len);
>>  }
>> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
>> index ba174aa45afa..a43479c3ff03 100644
>> --- a/drivers/media/i2c/adv7842.c
>> +++ b/drivers/media/i2c/adv7842.c
>> @@ -2763,7 +2763,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
>>                           str_true_false(io_read(sd, 0x6a) & 0x10));
>>         }
>>         v4l2_info(sd, "CP free run: %s\n",
>> -                 str_on_off(!!(cp_read(sd, 0xff) & 0x10)));
>> +                 str_on_off(cp_read(sd, 0xff) & 0x10));
>>         v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
>>                   io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
>>                   (io_read(sd, 0x01) & 0x70) >> 4);
>> diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
>> index 301b89e799d8..79cd61fb0205 100644
>> --- a/drivers/media/pci/saa7134/saa7134-cards.c
>> +++ b/drivers/media/pci/saa7134/saa7134-cards.c
>> @@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
>>                         rc = i2c_transfer(&dev->i2c_adap, &msg, 1);
>>                         pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n",
>>                                    dev->name, msg.addr,
>> -                                  str_yes_no(1 == rc));
>> +                                  str_yes_no(rc == 1));
>>                         if (rc == 1)
>>                                 dev->has_remote = SAA7134_REMOTE_I2C;
>>                 }
>> diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
>> index 90837ec6e70f..239f0b9d080a 100644
>> --- a/drivers/media/pci/saa7134/saa7134-input.c
>> +++ b/drivers/media/pci/saa7134/saa7134-input.c
>> @@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
>>                 rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
>>                 input_dbg("probe 0x%02x @ %s: %s\n",
>>                         msg_msi.addr, dev->i2c_adap.name,
>> -                       str_yes_no(1 == rc));
>> +                       str_yes_no(rc == 1));
>>                 break;
>>         case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
>>                 dev->init_data.name = "SnaZio* TVPVR PRO";
>> @@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
>>                 rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
>>                 input_dbg("probe 0x%02x @ %s: %s\n",
>>                         msg_msi.addr, dev->i2c_adap.name,
>> -                       str_yes_no(1 == rc));
>> +                       str_yes_no(rc == 1));
>>                 break;
>>         case SAA7134_BOARD_HAUPPAUGE_HVR1110:
>>                 dev->init_data.name = saa7134_boards[dev->board].name;
>> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
>> index 448c40caf363..b6c9bda214c8 100644
>> --- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
>> +++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
>> @@ -521,7 +521,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ctrl *cptr,
>>                 *len = scnprintf(buf,maxlen,"%d",val);
>>                 ret = 0;
>>         } else if (cptr->info->type == pvr2_ctl_bool) {
>> -               *len = scnprintf(buf,maxlen,"%s",str_true_false(val));
>> +               *len = scnprintf(buf, maxlen, "%s", str_true_false(val));
>>                 ret = 0;
>>         } else if (cptr->info->type == pvr2_ctl_enum) {
>>                 const char * const *names;
>> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>> index 96d3a0045fac..761d718478ca 100644
>> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>> @@ -338,7 +338,7 @@ static void trace_stbit(const char *name,int val)
>>  {
>>         pvr2_trace(PVR2_TRACE_STBITS,
>>                    "State bit %s <-- %s",
>> -                  name,str_true_false(val));
>> +                  name, str_true_false(val));
>>  }
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>> Ricardo Ribalda (45):
>>       media: staging: ipu3: Use string_choices helpers
>>       media: staging: atomisp: Use string_choices helpers
>>       media: core: Use string_choices helpers
>>       media: pwc-ctl: Use string_choices helpers
>>       media: pvrusb2:Use string_choices helpers
>>       media: em28xx: Use string_choices helpers
>>       media: dvb-usb: Use string_choices helpers
>>       media: dvb-usb-v2: Use string_choices helpers
>>       media: cx231xx: Use string_choices helpers
>>       media: tuners: Use string_choices helpers
>>       media: rc: Use string_choices helpers
>>       media: dvb-frontends: Use string_choices helpers
>>       media: pci: cx23885: Use string_choices helpers
>>       media: saa7134: Use string_choices helpers
>>       media: amphion: Use string_choices helpers
>>       media: pci: ivtv: Use string_choices helpers
>>       media: bttv: Use string_choices helpers
>>       media: xilinx: Use string_choices helpers
>>       media: platform: ti: Use string_choices helpers
>>       media: st: Use string_choices helpers
>>       media: coda: Use string_choices helpers
>>       media: aspeed: Use string_choices helpers
>>       media: ipu6: Use string_choices helpers
>>       media: cx18: Use string_choices helpers
>>       media: cobalt: Use string_choices helpers
>>       media: videobuf2: Use string_choices helpers
>>       media: cec: Use string_choices helpers
>>       media: b2c2: Use string_choices helpers
>>       media: siano: Use string_choices helpers
>>       media: i2c: cx25840: Use string_choices helpers
>>       media: i2c: vpx3220: Use string_choices helpers
>>       media: i2c: tvp7002: Use string_choices helpers
>>       media: i2c: ths8200: Use string_choices helpers
>>       media: i2c: tda1997x: Use string_choices helpers
>>       media: i2c: tc358743: Use string_choices helpers
>>       media: i2c: st-mipid02: Use string_choices helpers
>>       media: i2c: msp3400: Use string_choices helpers
>>       media: i2c: max9286: Use string_choices helpers
>>       media: i2c: saa717x: Use string_choices helpers
>>       media: i2c: saa7127: Use string_choices helpers
>>       media: i2c: saa7115: Use string_choices helpers
>>       media: i2c: saa7110: Use string_choices helpers
>>       media: i2c: adv7842: Use string_choices helpers
>>       media: i2c: adv76xx: Use string_choices helpers
>>       media: i2c: adv7511: Use string_choices helpers
>>
>>  drivers/media/cec/platform/cec-gpio/cec-gpio.c     |  4 +-
>>  drivers/media/cec/usb/pulse8/pulse8-cec.c          |  4 +-
>>  drivers/media/common/b2c2/flexcop-hw-filter.c      |  4 +-
>>  drivers/media/common/siano/sms-cards.c             |  3 +-
>>  drivers/media/common/videobuf2/videobuf2-core.c    |  5 ++-
>>  drivers/media/dvb-frontends/ascot2e.c              |  2 +-
>>  drivers/media/dvb-frontends/cx24120.c              |  4 +-
>>  drivers/media/dvb-frontends/cxd2841er.c            |  2 +-
>>  drivers/media/dvb-frontends/drxk_hard.c            |  4 +-
>>  drivers/media/dvb-frontends/helene.c               |  2 +-
>>  drivers/media/dvb-frontends/horus3a.c              |  2 +-
>>  drivers/media/dvb-frontends/sp2.c                  |  2 +-
>>  drivers/media/i2c/adv7511-v4l2.c                   | 11 +++---
>>  drivers/media/i2c/adv7604.c                        | 25 ++++++------
>>  drivers/media/i2c/adv7842.c                        | 40 ++++++++++----------
>>  drivers/media/i2c/cx25840/cx25840-core.c           |  4 +-
>>  drivers/media/i2c/cx25840/cx25840-ir.c             | 34 ++++++++---------
>>  drivers/media/i2c/max9286.c                        |  2 +-
>>  drivers/media/i2c/msp3400-driver.c                 |  4 +-
>>  drivers/media/i2c/saa7110.c                        |  2 +-
>>  drivers/media/i2c/saa7115.c                        |  2 +-
>>  drivers/media/i2c/saa7127.c                        | 15 +++++---
>>  drivers/media/i2c/saa717x.c                        |  2 +-
>>  drivers/media/i2c/st-mipid02.c                     |  2 +-
>>  drivers/media/i2c/tc358743.c                       | 44 ++++++++++------------
>>  drivers/media/i2c/tda1997x.c                       |  6 +--
>>  drivers/media/i2c/ths8200.c                        |  4 +-
>>  drivers/media/i2c/tvp7002.c                        |  2 +-
>>  drivers/media/i2c/vpx3220.c                        |  2 +-
>>  drivers/media/pci/bt8xx/bttv-cards.c               | 16 ++++----
>>  drivers/media/pci/bt8xx/bttv-driver.c              |  6 +--
>>  drivers/media/pci/cobalt/cobalt-driver.c           |  2 +-
>>  drivers/media/pci/cx18/cx18-av-core.c              |  4 +-
>>  drivers/media/pci/cx23885/altera-ci.c              |  2 +-
>>  drivers/media/pci/cx23885/cimax2.c                 |  2 +-
>>  drivers/media/pci/cx23885/cx23888-ir.c             | 36 +++++++++---------
>>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  2 +-
>>  drivers/media/pci/ivtv/ivtvfb.c                    |  4 +-
>>  drivers/media/pci/saa7134/saa7134-cards.c          |  2 +-
>>  drivers/media/pci/saa7134/saa7134-dvb.c            |  2 +-
>>  drivers/media/pci/saa7134/saa7134-input.c          |  6 +--
>>  drivers/media/pci/saa7134/saa7134-video.c          |  2 +-
>>  drivers/media/platform/amphion/venc.c              |  2 +-
>>  drivers/media/platform/amphion/vpu_dbg.c           |  2 +-
>>  drivers/media/platform/aspeed/aspeed-video.c       |  4 +-
>>  drivers/media/platform/chips-media/coda/imx-vdoa.c |  3 +-
>>  drivers/media/platform/st/sti/hva/hva-debugfs.c    |  6 +--
>>  drivers/media/platform/ti/omap3isp/ispstat.c       |  2 +-
>>  drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 18 ++++-----
>>  drivers/media/rc/ene_ir.c                          |  3 +-
>>  drivers/media/rc/mceusb.c                          |  3 +-
>>  drivers/media/rc/serial_ir.c                       |  5 ++-
>>  drivers/media/tuners/tda18250.c                    |  2 +-
>>  drivers/media/tuners/tda9887.c                     | 10 ++---
>>  drivers/media/usb/cx231xx/cx231xx-i2c.c            |  4 +-
>>  drivers/media/usb/cx231xx/cx231xx-video.c          |  2 +-
>>  drivers/media/usb/dvb-usb-v2/az6007.c              |  4 +-
>>  drivers/media/usb/dvb-usb-v2/dvb_usb_core.c        |  4 +-
>>  drivers/media/usb/dvb-usb/af9005-fe.c              |  4 +-
>>  drivers/media/usb/dvb-usb/dvb-usb-dvb.c            |  6 +--
>>  drivers/media/usb/dvb-usb/opera1.c                 |  8 ++--
>>  drivers/media/usb/em28xx/em28xx-i2c.c              |  4 +-
>>  drivers/media/usb/em28xx/em28xx-video.c            |  2 +-
>>  drivers/media/usb/pvrusb2/pvrusb2-ctrl.c           |  2 +-
>>  drivers/media/usb/pvrusb2/pvrusb2-debugifc.c       |  3 +-
>>  drivers/media/usb/pvrusb2/pvrusb2-encoder.c        |  5 +--
>>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |  6 +--
>>  drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c       |  3 +-
>>  drivers/media/usb/pwc/pwc-ctrl.c                   |  2 +-
>>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +-
>>  drivers/media/v4l2-core/v4l2-fwnode.c              | 12 +++---
>>  .../media/atomisp/pci/atomisp_compat_css20.c       |  2 +-
>>  .../media/atomisp/pci/atomisp_csi2_bridge.c        |  2 +-
>>  .../media/atomisp/pci/atomisp_gmin_platform.c      |  4 +-
>>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  4 +-
>>  .../media/atomisp/pci/runtime/binary/src/binary.c  |  2 +-
>>  drivers/staging/media/atomisp/pci/sh_css.c         |  2 +-
>>  drivers/staging/media/ipu3/ipu3-v4l2.c             |  4 +-
>>  78 files changed, 240 insertions(+), 239 deletions(-)
>> ---
>> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
>> change-id: 20240930-cocci-opportunity-40bca6a17c42
> 

