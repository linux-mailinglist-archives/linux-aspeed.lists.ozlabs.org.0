Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D198B03C
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkZ6mBBz3frl
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697870;
	cv=none; b=Ie2ficczT4Ff30rUHbc4Ak4yQNiSM8oQZtIs4IK9ty5bbeYYYmgxGw57eft4tk/jNrc8cQHQkutAWGWP1gZ5Gtt6GaV32pEBPw9sxOHSIBEW9yr/h6Q06SiMGh/TWu7exCrHocx7fF50xjcUQObsOgDeP6R7oJ1bpuxxqyWvd24pQOPY6NdNZ3irEDmKubGD15Yo4ZNnckKATURTCIyZha4PpPpIqdUjGmkkxYlk+vNIGqZ7UogcbUTiAA/U+lgN/QDclLtUQPtXsNdAuaDx3kntlnpSXP44bNLnHnO+mjVMejj/5GoXY3D/1faFyVrXWguKrklEtBBNKKzpaewagA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697870; c=relaxed/relaxed;
	bh=twxbXJ5TDeltaVeKhttrEsGiOfaRdH40FC0hJR39r6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0jiHBai5gzM/yUaPG5qTJEWHyPy+nVft077sCpUm1N4PVYniPD2A7ZFlQh5BE347lobV9yjNuRPSACIk0KpnPGyEKp7i8zlYyEOlscANnyylj8gQkPSYWws6Hx1zAPbUF2+GWNi+nNwMbetc7M4IJpqYeSQm68zV3/GwqXehlcpgupdOeUPxociY3917gn1YhQyzjCUXC+8EVsIfjO03hiQhxnxfKDkqHI9xnyzMo3oAzJMxql8DxOMGI2CQ8R00q5YWTDLRfACjqdThQN300XP2wE/HRPpysIBZkT0GDprQ+vkFsEbW++s7qZyLRzo3DOIIS6YUn8e8sgLz9JPbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nQsYEnUT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nQsYEnUT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKW20G9Nz2yLT
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:30 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6c5acb785f2so22941456d6.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697868; x=1728302668; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twxbXJ5TDeltaVeKhttrEsGiOfaRdH40FC0hJR39r6Y=;
        b=nQsYEnUTIIq/gseZcTqz1+hBBzoKJsHuxPCrHSDXQ1+3JH10UTYpXlAKmAJ0HyuqOd
         bUX5c37hqtFZty3o7Ynu/mGw6wDPpd3F5TGT83ia104mgQ72ShU1Z/4m4SNYgzq1VJea
         KXWhz0j+95Tm4hVwc2jBFremJPQb1OazwPK9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697868; x=1728302668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twxbXJ5TDeltaVeKhttrEsGiOfaRdH40FC0hJR39r6Y=;
        b=NbKhNg1iQq9rxQDeVVImqU5OVGIMKcH0xvrLKmFOblwyk5Tt5+23y0mDiRvbMgd9g+
         qW3272gnRv4AWebiCmTFKF4HQy0JHomM0bUuVXGTiQMC9QE/u66VyRhYN5CqozZiWAOW
         AlGYOzKsiXtvrPM2+569JfCUmSmEqSAZvdrdDb5ZCusduhP6wAr+kQn7gkiuGVQKwcrk
         nbfFaRHYzmsV6BRkJva8/xjj8bzHIRMIuAHlMfMVgpzYu56EER0/8UitUg8FP0XZE/3L
         YUjUZI9Dl1vVBmfcWPIqfLtXTsPk3wfMk8yjNdldr2F/gpu4LVAa+MGrCWvsVTvZ9Gfv
         cW9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmQ8fN2TqX2Oiv1L+gzdEJGJBehN+OhYDlxZ2u5mt/G80l/5cxoZ3aZbxGzuBhEeOzDAe5MrvAQq6OCtE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7Ta3whiZUVnNM8kYbT8pIaIvsGe03CIyKaBJDVRf2w2WOCEpZ
	zdHz5Q0gv9RYEO76+SROX198T+etkLuMgavg4olRnauc8SwHilnuBAOMOGkw5A==
X-Google-Smtp-Source: AGHT+IHtaxsqjQiVBMHhpTB74imzDxkcStWQYXWBLNrF2q84xYJXsQbMLDqKSk4hEvyHVvp0GEvPAw==
X-Received: by 2002:a05:6214:5701:b0:6cb:2cfa:3b9d with SMTP id 6a1803df08f44-6cb3b5cafb1mr203537826d6.14.1727697867933;
        Mon, 30 Sep 2024 05:04:27 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:07 +0000
Subject: [PATCH 12/45] media: dvb-frontends: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-12-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
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

The following cocci warnings are fixed:
drivers/media/dvb-frontends/cx24120.c:456:3-9: opportunity for str_enable_disable(enable)
drivers/media/dvb-frontends/cx24120.c:462:2-8: opportunity for str_enabled_disabled(enable)
drivers/media/dvb-frontends/helene.c:282:4-14: opportunity for str_read_write(write == 0)
drivers/media/dvb-frontends/cxd2841er.c:209:3-13: opportunity for str_read_write(write == 0)
drivers/media/dvb-frontends/drxk_hard.c:6282:22-28: opportunity for str_enable_disable(enable)
drivers/media/dvb-frontends/drxk_hard.c:1071:2-13: opportunity for str_enable_disable(mpeg_enable)
drivers/media/dvb-frontends/sp2.c:135:3-9: opportunity for str_read_write(( read ))
drivers/media/dvb-frontends/horus3a.c:41:3-13: opportunity for str_read_write(write == 0)
drivers/media/dvb-frontends/ascot2e.c:107:3-13: opportunity for str_read_write(write == 0)
drivers/media/usb/dvb-usb/af9005-fe.c:1282:27-31: opportunity for str_high_low(temp)
drivers/media/usb/dvb-usb/af9005-fe.c:790:30-32: opportunity for str_on_off(on)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/ascot2e.c   | 2 +-
 drivers/media/dvb-frontends/cx24120.c   | 4 ++--
 drivers/media/dvb-frontends/cxd2841er.c | 2 +-
 drivers/media/dvb-frontends/drxk_hard.c | 4 ++--
 drivers/media/dvb-frontends/helene.c    | 2 +-
 drivers/media/dvb-frontends/horus3a.c   | 2 +-
 drivers/media/dvb-frontends/sp2.c       | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
index cf8e5f1bd101..ec7a718428fc 100644
--- a/drivers/media/dvb-frontends/ascot2e.c
+++ b/drivers/media/dvb-frontends/ascot2e.c
@@ -104,7 +104,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv *priv,
 			      u8 reg, u8 write, const u8 *data, u32 len)
 {
 	dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n",
-		(write == 0 ? "read" : "write"), reg, len);
+		str_write_read(write), reg, len);
 	print_hex_dump_bytes("ascot2e: I2C data: ",
 		DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/cx24120.c b/drivers/media/dvb-frontends/cx24120.c
index 44515fdbe91d..a02aaebb091a 100644
--- a/drivers/media/dvb-frontends/cx24120.c
+++ b/drivers/media/dvb-frontends/cx24120.c
@@ -453,13 +453,13 @@ static int cx24120_msg_mpeg_output_global_config(struct cx24120_state *state,
 	ret = cx24120_message_send(state, &cmd);
 	if (ret != 0) {
 		dev_dbg(&state->i2c->dev, "failed to %s MPEG output\n",
-			enable ? "enable" : "disable");
+			str_enable_disable(enable));
 		return ret;
 	}
 
 	state->mpeg_enabled = enable;
 	dev_dbg(&state->i2c->dev, "MPEG output %s\n",
-		enable ? "enabled" : "disabled");
+		str_enabled_disabled(enable));
 
 	return 0;
 }
diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index d925ca24183b..d1b84cd9c510 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -206,7 +206,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_priv *priv,
 {
 	dev_dbg(&priv->i2c->dev,
 		"cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %*ph\n",
-		(write == 0 ? "read" : "write"), addr, reg, len, len, data);
+		str_write_read(write), addr, reg, len, len, data);
 }
 
 static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 87f3d4f0eb8c..cbb1ba0f1323 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -1068,7 +1068,7 @@ static int mpegts_configure_pins(struct drxk_state *state, bool mpeg_enable)
 	u16 err_cfg = 0;
 
 	dprintk(1, ": mpeg %s, %s mode\n",
-		mpeg_enable ? "enable" : "disable",
+		str_enable_disable(mpeg_enable),
 		state->m_enable_parallel ? "parallel" : "serial");
 
 	/* stop lock indicator process */
@@ -6279,7 +6279,7 @@ static int drxk_gate_ctrl(struct dvb_frontend *fe, int enable)
 {
 	struct drxk_state *state = fe->demodulator_priv;
 
-	dprintk(1, ": %s\n", enable ? "enable" : "disable");
+	dprintk(1, ": %s\n", str_enable_disable(enable));
 
 	if (state->m_drxk_state == DRXK_NO_DEV)
 		return -ENODEV;
diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index f127adee3ebb..b4527c141d9c 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -279,7 +279,7 @@ static void helene_i2c_debug(struct helene_priv *priv,
 		u8 reg, u8 write, const u8 *data, u32 len)
 {
 	dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n",
-			(write == 0 ? "read" : "write"), reg, len);
+			str_write_read(write), reg, len);
 	print_hex_dump_bytes("helene: I2C data: ",
 			DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb-frontends/horus3a.c
index 0330b78a5b3f..10300ebf3ca0 100644
--- a/drivers/media/dvb-frontends/horus3a.c
+++ b/drivers/media/dvb-frontends/horus3a.c
@@ -38,7 +38,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *priv,
 			      u8 reg, u8 write, const u8 *data, u32 len)
 {
 	dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n",
-		(write == 0 ? "read" : "write"), reg, len);
+		str_write_read(write), reg, len);
 	print_hex_dump_bytes("horus3a: I2C data: ",
 		DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/sp2.c b/drivers/media/dvb-frontends/sp2.c
index 75adf2a4589f..0332e3c312c6 100644
--- a/drivers/media/dvb-frontends/sp2.c
+++ b/drivers/media/dvb-frontends/sp2.c
@@ -132,7 +132,7 @@ static int sp2_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot, u8 acs,
 		return ret;
 
 	dev_dbg(&s->client->dev, "%s: slot=%d, addr=0x%04x, %s, data=%x",
-			(read) ? "read" : "write", slot, addr,
+			str_read_write(read), slot, addr,
 			(acs == SP2_CI_ATTR_ACS) ? "attr" : "io",
 			(read) ? mem : data);
 

-- 
2.46.1.824.gd892dcdcdd-goog

