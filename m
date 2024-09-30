Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64D98B036
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkY1cMfz3fmr
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::735"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697860;
	cv=none; b=HRLSkuZPZrISJwmduneFIyVF2eWtKOjAbEZmbolRwsDipP3nOod4EG+C3/sEY5p/Rtk87a761B/LQlwQxUG9okwADE7bnWXRjErS/86K4njt1ZygB/OBkccza796/HUNC8tyBDGv+RXhTgRUQJJKmjrKsgrTqpTw41aRP2rPzv9RgMfhezI49cN/FyZcsUMfMV0O8w4TQZMCw2u0sPpfxGd5kh8hpTKo8YRAPhAE2/E1krkSEmLQBpfgqMXc9g/Dy4ZtFtwUAJ5m2qQUldN0vNvE6hZHs41Su3aGRMfmEkHCknhTQKumo68c0yByaeKgX0dOD4d46Oq4JNRNoRe8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697860; c=relaxed/relaxed;
	bh=Oi1bEzb1SAt3y006RY0yDL5v/D/r838jI6u8v0CE/P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlnOPNcaevJlMKLpJ3YxF2eoW3wWDWrAYppDgKcYnUU6i+Wav4J3v95NIrmLdnuKtIUxxrrsOzc0iOyX3AS3SjoZa/RAUD9hq13f4hzo5fouot2ZYKnm1lacXOtBlp19/1JeZnquH10xHrr/q3aDJWBBhmNl/A6ZC0W4ToWjW/NnGChIJkFDWs6T9pR8hU4gGytpW+Ostw8VTxdlFhAgVTf5UYvvMtJcU0MiJVDcpHiflfedZIMxGPpDPDIWfPCQmbEDNPj8jXXtkmvIVKR6uxO0PIcd10ag+xCluFLtn36s1ZkjOn4Tv7ZLE6tzeIx72mFTDpNju7GxJQnYDz5LUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CPYhqlW3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CPYhqlW3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVr2knPz2yQj
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:20 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7a9b72749bcso386136485a.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697857; x=1728302657; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oi1bEzb1SAt3y006RY0yDL5v/D/r838jI6u8v0CE/P0=;
        b=CPYhqlW3M8FY/6Cm5XEAjo2CyutmwjyAe/x2tJO2xOgh97EPpGxI5Mh0cEaVJ+hqHD
         4WGtiS3k4bfiYzA+oBR4CHBNhHAoN9izqZzV6LA0i5R35+U+M8MXzbbahz19NGZ1ZBab
         FqXYQUC29w1vzptRHp7pm7keYhehRz7/mv+pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697857; x=1728302657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi1bEzb1SAt3y006RY0yDL5v/D/r838jI6u8v0CE/P0=;
        b=MqGa7BzWB77PJkKK7fEVNK5sctS+xHLE+UL5POd9tXPhlEr3l/haN/nrGitpf7eVdm
         hZG+tYz9AaXOKhcmdnr1cTRSR7Jc/a5Vkkoh+ovdDNNMFkWGAY9tHAoDJ8CdbOzpUi6I
         FEooQ4/Xs+PgvBGI3PwSGmKY/So7kvUOMHTvElHJAMSyrDyTvC6uv76aKjLn1KSqD+it
         BD4aGVxwAtyRgvpjrW9HrGNOGG3tTRf+XUlw65LviF4ticeaSBP4i/9e3hOxI+hVF9cl
         DX/y5H8Qs+xPpYahlj0zsWs1lyPDdVXjSvO6KOF6iBTQin+I/mNd8mDKXaYd9NANJ6mC
         sRFA==
X-Forwarded-Encrypted: i=1; AJvYcCXNBbfzXu4ZYt1riu4eGUChiTz2K/KtHmwyljSVrIRvG3WENEi4EC17VRyJ0pp2K1GBxMkwloJG8JPUoHY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw/VXZ0V/HiYQX6rn0uD1ZpkUd6f/9+rseTVNNwVN+y4WU47uJU
	llQsWNBOTr9nzcllBN8XCS5r03j+CvyTQEMDJBMTSLIrg3wr3EjB60NTmb4K5g==
X-Google-Smtp-Source: AGHT+IEfJSXK0Wsel23PY6RuLEcqGR+eVsnaqOIyvQM277nf0XUs151BJ1cKdgq24SPhmJrtG19jVA==
X-Received: by 2002:a05:6214:488f:b0:6cb:5fba:e006 with SMTP id 6a1803df08f44-6cb5fbae166mr61875236d6.29.1727697857240;
        Mon, 30 Sep 2024 05:04:17 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:02 +0000
Subject: [PATCH 07/45] media: dvb-usb: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-7-81e137456ce0@chromium.org>
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
drivers/media/usb/dvb-usb/opera1.c:326:26-31: opportunity for str_enable_disable(onoff)
drivers/media/usb/dvb-usb/opera1.c:310:3-8: opportunity for str_on_off(onoff)
drivers/media/usb/dvb-usb/opera1.c:283:19-24: opportunity for str_on_off(onoff)
drivers/media/usb/dvb-usb/opera1.c:296:23-28: opportunity for str_on_off(onoff)
drivers/media/usb/dvb-usb/dvb-usb-dvb.c:49:21-26: opportunity for str_on_off(onoff)
drivers/media/usb/dvb-usb/dvb-usb-dvb.c:47:2-46: opportunity for str_yes_no(adap -> fe_adap [ adap -> active_fe ] . pid_filtering)
drivers/media/usb/dvb-usb/af9005-fe.c:1282:27-31: opportunity for str_high_low(temp)
drivers/media/usb/dvb-usb/af9005-fe.c:790:30-32: opportunity for str_on_off(on)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/dvb-usb/af9005-fe.c   | 4 ++--
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c | 6 +++---
 drivers/media/usb/dvb-usb/opera1.c      | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/af9005-fe.c b/drivers/media/usb/dvb-usb/af9005-fe.c
index 404e56b32145..ea3aaf3a56cb 100644
--- a/drivers/media/usb/dvb-usb/af9005-fe.c
+++ b/drivers/media/usb/dvb-usb/af9005-fe.c
@@ -787,7 +787,7 @@ static int af9005_fe_power(struct dvb_frontend *fe, int on)
 	struct af9005_fe_state *state = fe->demodulator_priv;
 	u8 temp = on;
 	int ret;
-	deb_info("power %s tuner\n", on ? "on" : "off");
+	deb_info("power %s tuner\n", str_on_off(on));
 	ret = af9005_send_command(state->d, 0x03, &temp, 1, NULL, 0);
 	return ret;
 }
@@ -1279,7 +1279,7 @@ static int af9005_fe_get_frontend(struct dvb_frontend *fe,
 	if (ret)
 		return ret;
 	/* if temp is set = high priority */
-	deb_info("PRIORITY %s\n", temp ? "high" : "low");
+	deb_info("PRIORITY %s\n", str_high_low(temp));
 
 	/* high coderate */
 	ret =
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
index 0a7f8ba90992..b663c3dff25c 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
@@ -44,9 +44,9 @@ static int dvb_usb_ctrl_feed(struct dvb_demux_feed *dvbdmxfeed, int onoff)
 
 	/* activate the pid on the device specific pid_filter */
 	deb_ts("setting pid (%s): %5d %04x at index %d '%s'\n",
-		adap->fe_adap[adap->active_fe].pid_filtering ?
-		"yes" : "no", dvbdmxfeed->pid, dvbdmxfeed->pid,
-		dvbdmxfeed->index, onoff ? "on" : "off");
+		str_yes_no(adap->fe_adap[adap->active_fe].pid_filtering),
+		dvbdmxfeed->pid, dvbdmxfeed->pid,
+		dvbdmxfeed->index, str_on_off(onoff));
 	if (adap->props.fe[adap->active_fe].caps & DVB_USB_ADAP_HAS_PID_FILTER &&
 		adap->fe_adap[adap->active_fe].pid_filtering &&
 		adap->props.fe[adap->active_fe].pid_filter != NULL)
diff --git a/drivers/media/usb/dvb-usb/opera1.c b/drivers/media/usb/dvb-usb/opera1.c
index 268f05fc8691..8412b64660d8 100644
--- a/drivers/media/usb/dvb-usb/opera1.c
+++ b/drivers/media/usb/dvb-usb/opera1.c
@@ -280,7 +280,7 @@ static int opera1_power_ctrl(struct dvb_usb_device *d, int onoff)
 	u8 val = onoff ? 0x01 : 0x00;
 
 	if (dvb_usb_opera1_debug)
-		info("power %s", onoff ? "on" : "off");
+		info("power %s", str_on_off(onoff));
 	return opera1_xilinx_rw(d->udev, 0xb7, val,
 				&val, 1, OPERA_WRITE_MSG);
 }
@@ -293,7 +293,7 @@ static int opera1_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 		{.addr = ADDR_B1A6_STREAM_CTRL,.buf = onoff ? buf_start : buf_stop,.len = 2},
 	};
 	if (dvb_usb_opera1_debug)
-		info("streaming %s", onoff ? "on" : "off");
+		info("streaming %s", str_on_off(onoff));
 	i2c_transfer(&adap->dev->i2c_adap, start_tuner, 1);
 	return 0;
 }
@@ -307,7 +307,7 @@ static int opera1_pid_filter(struct dvb_usb_adapter *adap, int index, u16 pid,
 	};
 	if (dvb_usb_opera1_debug)
 		info("pidfilter index: %d pid: %d %s", index, pid,
-			onoff ? "on" : "off");
+			str_on_off(onoff));
 	b_pid[0] = (2 * index) + 4;
 	b_pid[1] = onoff ? (pid & 0xff) : (0x00);
 	b_pid[2] = onoff ? ((pid >> 8) & 0xff) : (0x00);
@@ -323,7 +323,7 @@ static int opera1_pid_filter_control(struct dvb_usb_adapter *adap, int onoff)
 		{.addr = ADDR_B1A6_STREAM_CTRL,.buf = b_pid,.len = 3},
 	};
 	if (dvb_usb_opera1_debug)
-		info("%s hw-pidfilter", onoff ? "enable" : "disable");
+		info("%s hw-pidfilter", str_enable_disable(onoff));
 	for (; u < 0x7e; u += 2) {
 		b_pid[0] = u;
 		b_pid[1] = 0;

-- 
2.46.1.824.gd892dcdcdd-goog

