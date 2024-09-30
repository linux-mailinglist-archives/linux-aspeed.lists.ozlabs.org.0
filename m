Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F274A98B037
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkY40S1z3fnn
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697863;
	cv=none; b=T9N5IThmSvdtCUcNG6ioRc8Xi4ycQqcGJKhTuR13mt29f2kQNgt4VJ7fhQFcK3TJ0PSLgOtKIExXNN4Ybk2MeAlXu81EFF9s9SsZ1wK5fry9lbyiWI8FCE4nqlUuYVvqBGdlwmvezdMSxk/goVOmRDlSrcqa2ilatzAok4pw6ojjVt59TAt89CSXaxsfZmRlaDWwR81XkjcFNyx24TFo+f3cCMmiTjY8JsB9Grs5Wbf81agOGO8PFIby/Q98LGd79+Qqw9qZhYysfXcKQ86cgM7REt+fg7i0XNuFuSAw3XZpn17VVAkv3p5fAKJTi1nx+xGDKVK47ssmB8Xvc1b3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697863; c=relaxed/relaxed;
	bh=oyq88t8pWb3nvRMsH4SWW8lN0+v/o8BALR3Lyr5Ymdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2d6l/iiEzpRb428ltHEVZzMQ3uVFn2tADiurqGYfGVGKn56GyT7868xJNeqVd2hsl+WDvhqNLnSIjfzPMSt9GZ6VOgJSiur7WpORj/rG7K32kvdCR/m76xN3eJ/fwbMRKUd4h+z1TZunjIVSz1/0ceF8odK5LRXu+lSJQS9tEZqEau6BoL9cLlOlKgzhzqoXFr0sRUC7m0S6OmRzXafexqUW32SCjsQLZ6NEB5teHJ+iL7occjORjxRvUjgglarnWY0ZWI8K4HXdf1gweIGrhfTDDMiLz9BqM2eXlYBCZjgzkCfDdmI8Bqcm7eosqFLJ//jcDK9f7544irWqhd67g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kFLOwk4u; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kFLOwk4u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVt5RqPz2yPq
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:22 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-709346604a7so2209599a34.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697860; x=1728302660; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyq88t8pWb3nvRMsH4SWW8lN0+v/o8BALR3Lyr5Ymdo=;
        b=kFLOwk4uco2wTKV7Qw+NxLXIqshv3etsVNPwcSZCjTHyDQBaEcGKEoOYl3hldWcHEV
         yT/vgPU/TsugxWxTYuyWcLQB3KYgZf0uWOu/60NgV7Nv9onTulTM4LTw628QLSmJyqsZ
         bBpLyNcID+n1Y4+wBo+/F3SIMoRNfKS1KVoL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697860; x=1728302660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyq88t8pWb3nvRMsH4SWW8lN0+v/o8BALR3Lyr5Ymdo=;
        b=nDLVQeeSkO810eDzfLQBwNHoWxCaLifKF0agv1/N5syKZi5NkESK1LrZsWY4ihm2gG
         fV3M1HKKI/V/G8MA9GaffBZtlEyKsoaZ8XXCe3jBO4LXT4unvc8gdgyVGA/jRXUYyKqJ
         v7gwQrGYyV1Qy3SYOM6suoPZDZWhw2mHH8Cw7HuKEHv0Rc354Xmv+8T4dkm8DN98qxPa
         4ep1dGLF5ihcX3Uzd51p76Oi/pucUmEHBibsLsqxsE+mRgj9lBN8ByLzSI1gRhhlXHJC
         FRfnMV6mfxLp9r04GHgyOEvoSis+Ong1a6rhDbsAz8X9qhoWJLHyk69uQyambYa7uacy
         iipA==
X-Forwarded-Encrypted: i=1; AJvYcCV3zn4anR2PJo0c0HS2jQiwMdSEjoOnv5z8Tx61VigwJdxOupAs+Ch/k/00LZCu+8wi5tGLyn21uoS4MtM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEflHysk/ZDp++C+IN4bysOAqN3dAPAzft/Ffx/L4rcX70Olpk
	U5rlr5Rw8dzmKurpKrDzsgJh1Mt+/N9eIiPlSTYbRJt4iRFgwdAbV87ANwv5pQ==
X-Google-Smtp-Source: AGHT+IGlFIIrabSCXdg/bJ9e3MVgi6gfLFZpzZGyv3CgenARKjE0A4bquSvob8woJ1CdObZm4BjrEg==
X-Received: by 2002:a05:6359:8488:b0:1bc:d1ba:225 with SMTP id e5c5f4694b2df-1becbb8fbe2mr306353155d.10.1727697859596;
        Mon, 30 Sep 2024 05:04:19 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:03 +0000
Subject: [PATCH 08/45] media: dvb-usb-v2: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-8-81e137456ce0@chromium.org>
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
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:250:3-22: opportunity for str_yes_no(adap -> pid_filtering)
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:337:3-22: opportunity for str_yes_no(adap -> pid_filtering)
drivers/media/usb/dvb-usb-v2/az6007.c:82:32-38: opportunity for str_enable_disable(enable)
drivers/media/usb/dvb-usb-v2/az6007.c:192:32-37: opportunity for str_enable_disable(onoff)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/dvb-usb-v2/az6007.c       | 4 ++--
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 2410054ddb2c..1e9f946193a6 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -79,7 +79,7 @@ static int drxk_gate_ctrl(struct dvb_frontend *fe, int enable)
 	struct dvb_usb_adapter *adap = fe->sec_priv;
 	int status = 0;
 
-	pr_debug("%s: %s\n", __func__, enable ? "enable" : "disable");
+	pr_debug("%s: %s\n", __func__, str_enable_disable(enable));
 
 	if (!adap || !st)
 		return -EINVAL;
@@ -189,7 +189,7 @@ static int az6007_streaming_ctrl(struct dvb_frontend *fe, int onoff)
 {
 	struct dvb_usb_device *d = fe_to_d(fe);
 
-	pr_debug("%s: %s\n", __func__, onoff ? "enable" : "disable");
+	pr_debug("%s: %s\n", __func__, str_enable_disable(onoff));
 
 	return az6007_write(d, 0xbc, onoff, 0, NULL, 0);
 }
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index f1c79f351ec8..c0a40112d043 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -247,7 +247,7 @@ static int dvb_usb_start_feed(struct dvb_demux_feed *dvbdmxfeed)
 	dev_dbg(&d->udev->dev,
 			"%s: adap=%d active_fe=%d feed_type=%d setting pid [%s]: %04x (%04d) at index %d\n",
 			__func__, adap->id, adap->active_fe, dvbdmxfeed->type,
-			adap->pid_filtering ? "yes" : "no", dvbdmxfeed->pid,
+			str_yes_no(adap->pid_filtering), dvbdmxfeed->pid,
 			dvbdmxfeed->pid, dvbdmxfeed->index);
 
 	/* wait init is done */
@@ -334,7 +334,7 @@ static int dvb_usb_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
 	dev_dbg(&d->udev->dev,
 			"%s: adap=%d active_fe=%d feed_type=%d setting pid [%s]: %04x (%04d) at index %d\n",
 			__func__, adap->id, adap->active_fe, dvbdmxfeed->type,
-			adap->pid_filtering ? "yes" : "no", dvbdmxfeed->pid,
+			str_yes_no(adap->pid_filtering), dvbdmxfeed->pid,
 			dvbdmxfeed->pid, dvbdmxfeed->index);
 
 	if (adap->active_fe == -1)

-- 
2.46.1.824.gd892dcdcdd-goog

