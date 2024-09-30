Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9634298B030
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkV2ZBDz3dDp
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::735"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697846;
	cv=none; b=OzHBlGowNcQ5frnd5HxtmCzowOD7iBezEks8mHiw9esJ1zS9AWyvkjU40IuNO+3GvxBYvzixJj+IJiC7pFiDd0lJFAbhLo2be4SlFe5nBXSVjfudExeo0rcIKs40JK7yvtnTKIUzTiVoepXsijJ1Z5bnmL5FOrRRSrs8ZibbnHc4HzNGl0Yl5bYC7sawoNJscgNu5igWvChUU428sODeXzWcdz444nVeEWXpu6yjIVVv/YseLPw1VZmHIqvC6AHwLebe+RYrXMjWabi4tuJZyj6NseC8k2aPYLiymy1rsW2ZEzXG7ZIoLFty+ursAT8qb6OUDebM8PfFdnT+LHFS9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697846; c=relaxed/relaxed;
	bh=/5VgfIVfz1YgxOOgFfrYzixq0Bnk4fhK8m8Ic5VNHEI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mL4bfpg3zeJH13kM2KIq8tTXtYpBAmRKr093AWYRPbXxu9kt/i7cAXglhXHJzNgww4BNs2GPILWlvaCT27vu3nTkLH3me+HlvjBukNh1Oh82Q/w2kIqR0AJm9ZtFBtiaHDCpkkbM6xaCBM2MQ4nj7Lj9pnRqG/ZRTXsvuqo3gPqgYn/mQO8K5Y7KazFCJHFNFVdLP6kd484QBxku2SvljcJOhDplF/RhCSVGGg2lDMWHsT5k6PiaiQkowx8WmZgLONCstuaS6Nc2QrOYCZTD7wtIep1EjPmEi8DF3aXG7LuIwZukBvFqh2lOulgqiDvdrESld3gEPMuvwrUSVWjFIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FB0AFwQ/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FB0AFwQ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVY5Lcwz2xCd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:04 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7a9a30a045cso419763685a.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697841; x=1728302641; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/5VgfIVfz1YgxOOgFfrYzixq0Bnk4fhK8m8Ic5VNHEI=;
        b=FB0AFwQ/uaFKrRPRTCawmzQ+8BobPw9bySLpYBUUpBy3SqrpTK2KDKwtSV3RBnlRB2
         53TUVY1oFsTE65T/MtQBUJS3P4o7K/paWgvAQSfweaPpSSLqYzSNwx6XTc95R7kxHFCI
         Yeg74ow9nG66goifmOPMP/UTwAYeDZ6qgQxlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697841; x=1728302641;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5VgfIVfz1YgxOOgFfrYzixq0Bnk4fhK8m8Ic5VNHEI=;
        b=bo39PhlnS6xgfKbOK2qF7+a5LFL4lIPV4eqzTa5PqjyjuEu6n5J3imi9hlPQnGRj8P
         0MaT0S+ZKI+F5q6YDIHdB6+g3AhyJruJ3/gd3OZOVtcyOA7tnIDxXgUxc5xoPPAq8YhE
         hp2YamPOexRKEAyUq9qeKvJtOkN+A102VNxvR6rmC3+UCNeW9tNjBY+veBIMTK9V9Aol
         RiM6y1VcnvWmSfWx+uJM3NsEMR6bANWb0i1HOK7s4sbENqrOM01cvJorZbcgad7zaR0u
         NZQAvrGGR1TuSS2U5+xVP3ZeODxydbkV3OR1YSzFwDebQTvpPeusp/v1Ix/9ql6MLnCw
         zTcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSGHyYHluQQPX4qewfu9qYa8JZiqqGhlAkFZeRZPP6ewoEACtIVNDXoMjwreS63IXMLGgIIkz3T416pPg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzWt3XdRfF7ZDF1zVnVtrwbAyuYO02+lOCx33+SsG9POQGiN4CS
	1Buoz3rQkDLp4BjXEqlPZZAXXsZXAgoyOyJOuCd/lRN8OArLfAWCp6PUcHkR2w==
X-Google-Smtp-Source: AGHT+IEkkoZ77UVe1HBseRyAv4Z3HJ6VkOYoXbNi44RuV9k8F46CRfqyvbe5oQOx55Ew0ldDus/+TA==
X-Received: by 2002:a05:6214:4306:b0:6c6:9bb9:b435 with SMTP id 6a1803df08f44-6cb3b64c231mr158464086d6.53.1727697841211;
        Mon, 30 Sep 2024 05:04:01 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/45] media: Use string_choice helpers
Date: Mon, 30 Sep 2024 12:03:55 +0000
Message-Id: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKyT+mYC/x3MQQqAIBBA0avErBPUpKirRAubppqNiloU0d2Tl
 m/x/wOJIlOCoXog0smJvStQdQW4W7eR4KUYtNRG9o0U6BFZ+BB8zIfjfAsjZ7StVR0aDaULkVa
 +/uc4ve8H7bQ6S2MAAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.13.0
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

include/linux/string_choices.h contains a set of helpers that can be
used instead of hard coding some strings.

Cocci has located some places where the helpers can be used. This
patchset uses the diff generated by cocci, plus these changes:

diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
index 8c3eb5d69dda..ec7a718428fc 100644
--- a/drivers/media/dvb-frontends/ascot2e.c
+++ b/drivers/media/dvb-frontends/ascot2e.c
@@ -104,7 +104,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv *priv,
                              u8 reg, u8 write, const u8 *data, u32 len)
 {
        dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n",
-               str_read_write(write == 0), reg, len);
+               str_write_read(write), reg, len);
        print_hex_dump_bytes("ascot2e: I2C data: ",
                DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index db684f314b47..d1b84cd9c510 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -206,7 +206,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_priv *priv,
 {
        dev_dbg(&priv->i2c->dev,
                "cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %*ph\n",
-               str_read_write(write == 0), addr, reg, len, len, data);
+               str_write_read(write), addr, reg, len, len, data);
 }
 
 static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index 52198cb49dba..b4527c141d9c 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -279,7 +279,7 @@ static void helene_i2c_debug(struct helene_priv *priv,
                u8 reg, u8 write, const u8 *data, u32 len)
 {
        dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n",
-                       str_read_write(write == 0), reg, len);
+                       str_write_read(write), reg, len);
        print_hex_dump_bytes("helene: I2C data: ",
                        DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb-frontends/horus3a.c
index 84385079918c..10300ebf3ca0 100644
--- a/drivers/media/dvb-frontends/horus3a.c
+++ b/drivers/media/dvb-frontends/horus3a.c
@@ -38,7 +38,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *priv,
                              u8 reg, u8 write, const u8 *data, u32 len)
 {
        dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n",
-               str_read_write(write == 0), reg, len);
+               str_write_read(write), reg, len);
        print_hex_dump_bytes("horus3a: I2C data: ",
                DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index ba174aa45afa..a43479c3ff03 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2763,7 +2763,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
                          str_true_false(io_read(sd, 0x6a) & 0x10));
        }
        v4l2_info(sd, "CP free run: %s\n",
-                 str_on_off(!!(cp_read(sd, 0xff) & 0x10)));
+                 str_on_off(cp_read(sd, 0xff) & 0x10));
        v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
                  io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
                  (io_read(sd, 0x01) & 0x70) >> 4);
diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
index 301b89e799d8..79cd61fb0205 100644
--- a/drivers/media/pci/saa7134/saa7134-cards.c
+++ b/drivers/media/pci/saa7134/saa7134-cards.c
@@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
                        rc = i2c_transfer(&dev->i2c_adap, &msg, 1);
                        pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n",
                                   dev->name, msg.addr,
-                                  str_yes_no(1 == rc));
+                                  str_yes_no(rc == 1));
                        if (rc == 1)
                                dev->has_remote = SAA7134_REMOTE_I2C;
                }
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index 90837ec6e70f..239f0b9d080a 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
                rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
                input_dbg("probe 0x%02x @ %s: %s\n",
                        msg_msi.addr, dev->i2c_adap.name,
-                       str_yes_no(1 == rc));
+                       str_yes_no(rc == 1));
                break;
        case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
                dev->init_data.name = "SnaZio* TVPVR PRO";
@@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
                rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
                input_dbg("probe 0x%02x @ %s: %s\n",
                        msg_msi.addr, dev->i2c_adap.name,
-                       str_yes_no(1 == rc));
+                       str_yes_no(rc == 1));
                break;
        case SAA7134_BOARD_HAUPPAUGE_HVR1110:
                dev->init_data.name = saa7134_boards[dev->board].name;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
index 448c40caf363..b6c9bda214c8 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
@@ -521,7 +521,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ctrl *cptr,
                *len = scnprintf(buf,maxlen,"%d",val);
                ret = 0;
        } else if (cptr->info->type == pvr2_ctl_bool) {
-               *len = scnprintf(buf,maxlen,"%s",str_true_false(val));
+               *len = scnprintf(buf, maxlen, "%s", str_true_false(val));
                ret = 0;
        } else if (cptr->info->type == pvr2_ctl_enum) {
                const char * const *names;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 96d3a0045fac..761d718478ca 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -338,7 +338,7 @@ static void trace_stbit(const char *name,int val)
 {
        pvr2_trace(PVR2_TRACE_STBITS,
                   "State bit %s <-- %s",
-                  name,str_true_false(val));
+                  name, str_true_false(val));
 }

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (45):
      media: staging: ipu3: Use string_choices helpers
      media: staging: atomisp: Use string_choices helpers
      media: core: Use string_choices helpers
      media: pwc-ctl: Use string_choices helpers
      media: pvrusb2:Use string_choices helpers
      media: em28xx: Use string_choices helpers
      media: dvb-usb: Use string_choices helpers
      media: dvb-usb-v2: Use string_choices helpers
      media: cx231xx: Use string_choices helpers
      media: tuners: Use string_choices helpers
      media: rc: Use string_choices helpers
      media: dvb-frontends: Use string_choices helpers
      media: pci: cx23885: Use string_choices helpers
      media: saa7134: Use string_choices helpers
      media: amphion: Use string_choices helpers
      media: pci: ivtv: Use string_choices helpers
      media: bttv: Use string_choices helpers
      media: xilinx: Use string_choices helpers
      media: platform: ti: Use string_choices helpers
      media: st: Use string_choices helpers
      media: coda: Use string_choices helpers
      media: aspeed: Use string_choices helpers
      media: ipu6: Use string_choices helpers
      media: cx18: Use string_choices helpers
      media: cobalt: Use string_choices helpers
      media: videobuf2: Use string_choices helpers
      media: cec: Use string_choices helpers
      media: b2c2: Use string_choices helpers
      media: siano: Use string_choices helpers
      media: i2c: cx25840: Use string_choices helpers
      media: i2c: vpx3220: Use string_choices helpers
      media: i2c: tvp7002: Use string_choices helpers
      media: i2c: ths8200: Use string_choices helpers
      media: i2c: tda1997x: Use string_choices helpers
      media: i2c: tc358743: Use string_choices helpers
      media: i2c: st-mipid02: Use string_choices helpers
      media: i2c: msp3400: Use string_choices helpers
      media: i2c: max9286: Use string_choices helpers
      media: i2c: saa717x: Use string_choices helpers
      media: i2c: saa7127: Use string_choices helpers
      media: i2c: saa7115: Use string_choices helpers
      media: i2c: saa7110: Use string_choices helpers
      media: i2c: adv7842: Use string_choices helpers
      media: i2c: adv76xx: Use string_choices helpers
      media: i2c: adv7511: Use string_choices helpers

 drivers/media/cec/platform/cec-gpio/cec-gpio.c     |  4 +-
 drivers/media/cec/usb/pulse8/pulse8-cec.c          |  4 +-
 drivers/media/common/b2c2/flexcop-hw-filter.c      |  4 +-
 drivers/media/common/siano/sms-cards.c             |  3 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |  5 ++-
 drivers/media/dvb-frontends/ascot2e.c              |  2 +-
 drivers/media/dvb-frontends/cx24120.c              |  4 +-
 drivers/media/dvb-frontends/cxd2841er.c            |  2 +-
 drivers/media/dvb-frontends/drxk_hard.c            |  4 +-
 drivers/media/dvb-frontends/helene.c               |  2 +-
 drivers/media/dvb-frontends/horus3a.c              |  2 +-
 drivers/media/dvb-frontends/sp2.c                  |  2 +-
 drivers/media/i2c/adv7511-v4l2.c                   | 11 +++---
 drivers/media/i2c/adv7604.c                        | 25 ++++++------
 drivers/media/i2c/adv7842.c                        | 40 ++++++++++----------
 drivers/media/i2c/cx25840/cx25840-core.c           |  4 +-
 drivers/media/i2c/cx25840/cx25840-ir.c             | 34 ++++++++---------
 drivers/media/i2c/max9286.c                        |  2 +-
 drivers/media/i2c/msp3400-driver.c                 |  4 +-
 drivers/media/i2c/saa7110.c                        |  2 +-
 drivers/media/i2c/saa7115.c                        |  2 +-
 drivers/media/i2c/saa7127.c                        | 15 +++++---
 drivers/media/i2c/saa717x.c                        |  2 +-
 drivers/media/i2c/st-mipid02.c                     |  2 +-
 drivers/media/i2c/tc358743.c                       | 44 ++++++++++------------
 drivers/media/i2c/tda1997x.c                       |  6 +--
 drivers/media/i2c/ths8200.c                        |  4 +-
 drivers/media/i2c/tvp7002.c                        |  2 +-
 drivers/media/i2c/vpx3220.c                        |  2 +-
 drivers/media/pci/bt8xx/bttv-cards.c               | 16 ++++----
 drivers/media/pci/bt8xx/bttv-driver.c              |  6 +--
 drivers/media/pci/cobalt/cobalt-driver.c           |  2 +-
 drivers/media/pci/cx18/cx18-av-core.c              |  4 +-
 drivers/media/pci/cx23885/altera-ci.c              |  2 +-
 drivers/media/pci/cx23885/cimax2.c                 |  2 +-
 drivers/media/pci/cx23885/cx23888-ir.c             | 36 +++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  2 +-
 drivers/media/pci/ivtv/ivtvfb.c                    |  4 +-
 drivers/media/pci/saa7134/saa7134-cards.c          |  2 +-
 drivers/media/pci/saa7134/saa7134-dvb.c            |  2 +-
 drivers/media/pci/saa7134/saa7134-input.c          |  6 +--
 drivers/media/pci/saa7134/saa7134-video.c          |  2 +-
 drivers/media/platform/amphion/venc.c              |  2 +-
 drivers/media/platform/amphion/vpu_dbg.c           |  2 +-
 drivers/media/platform/aspeed/aspeed-video.c       |  4 +-
 drivers/media/platform/chips-media/coda/imx-vdoa.c |  3 +-
 drivers/media/platform/st/sti/hva/hva-debugfs.c    |  6 +--
 drivers/media/platform/ti/omap3isp/ispstat.c       |  2 +-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 18 ++++-----
 drivers/media/rc/ene_ir.c                          |  3 +-
 drivers/media/rc/mceusb.c                          |  3 +-
 drivers/media/rc/serial_ir.c                       |  5 ++-
 drivers/media/tuners/tda18250.c                    |  2 +-
 drivers/media/tuners/tda9887.c                     | 10 ++---
 drivers/media/usb/cx231xx/cx231xx-i2c.c            |  4 +-
 drivers/media/usb/cx231xx/cx231xx-video.c          |  2 +-
 drivers/media/usb/dvb-usb-v2/az6007.c              |  4 +-
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c        |  4 +-
 drivers/media/usb/dvb-usb/af9005-fe.c              |  4 +-
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c            |  6 +--
 drivers/media/usb/dvb-usb/opera1.c                 |  8 ++--
 drivers/media/usb/em28xx/em28xx-i2c.c              |  4 +-
 drivers/media/usb/em28xx/em28xx-video.c            |  2 +-
 drivers/media/usb/pvrusb2/pvrusb2-ctrl.c           |  2 +-
 drivers/media/usb/pvrusb2/pvrusb2-debugifc.c       |  3 +-
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c        |  5 +--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |  6 +--
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c       |  3 +-
 drivers/media/usb/pwc/pwc-ctrl.c                   |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              | 12 +++---
 .../media/atomisp/pci/atomisp_compat_css20.c       |  2 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |  2 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  4 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  4 +-
 .../media/atomisp/pci/runtime/binary/src/binary.c  |  2 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |  2 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |  4 +-
 78 files changed, 240 insertions(+), 239 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20240930-cocci-opportunity-40bca6a17c42

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

