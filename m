Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4798B039
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkY6GtHz3fpY
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697864;
	cv=none; b=HcFtYTUDLibgQ6sLbhgPmLqu+1xXoNaj2bW0xuOOhFNS097sDCtKeSVeKCYswpRaGg9rOfr3xuo3tt3Ji6hnrg5ZIblcDS83ucwLTAO+OWYZcwETk7FdyttkpQIZ+RSEHfWRbUnzKpzhtYql/z/V7pUoTDlxu1+QUEfWZ9iLG22Yw+vjTc8UbD0mPaZAk6dPrNw39EBoMS4Z8VR2Wjf38fR+2LIMCWsRrGOK8OOKApX1TudIL/Xrfx3J9dIDbaMwZpCzGq6Kj2OTK9GCKyOxhW0hPa1eZo/QHRpAcfX7XK5/HzHhiuG1ZhYd0lyh1dr7TFh8IGCuN3rraD4257zbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697864; c=relaxed/relaxed;
	bh=o0DduMWqX0LlLrfJFzeOwfQDx0mBLtEZV9WrRhA8PwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHU7+espb3j16eS12GcCiRH3xwdOp5PeU1F6N50+m5u+Ub7WqanPmKiuIhM/7PU2007JRuk5CGyWOH49/+gUsfY3CybFALIHCddfhb6PKT2ooDA226AxctEt68vwjUo7l+OB/D14hB1QCrswWcYGYg+Llat1H1eZ3O8VRrim9EfcDOfhO0IhxQVBd2St4JVQpV1R/56mHssJZ/wLUcUb6ni1IA3rmahwfyVcueOJ/xY4PP82O9bniF4gK0a5IyL55VwW3OsrAQGJ1w4cZcrkzEk7YaAS6e5lsfcgKv4dzhbB6/N6KVubP3KaTRQnOU0rUq8qsUuztOea8XEm81E9HA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jWT8/rXL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jWT8/rXL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVw3yg1z2yNf
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:24 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6c3f12d3930so37215106d6.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697861; x=1728302661; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0DduMWqX0LlLrfJFzeOwfQDx0mBLtEZV9WrRhA8PwA=;
        b=jWT8/rXLvi6Yih7dL42c9zk+8KhX9S/a0i7iQL1NByMPmFE1DO57K5Wtnt5awSqr/R
         dRoXMnsO8ZRPtVn5ZFPLXaaZhFtl39VLO5EFN3YyQQuw1+8kLC6pkVc+5zmQ62UmhG5z
         NxFhgG8vxsLx7iMsMUemK9y7H+z52Jvfc7nLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697861; x=1728302661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0DduMWqX0LlLrfJFzeOwfQDx0mBLtEZV9WrRhA8PwA=;
        b=l60P7ZzFJcuAozgQeJLs5R27CLzJuTCoKS1/gpWb2N9ZUtFp49mp+3/67igA14P/1t
         u1cQDcklliuBQO2rw87oxbGg1gF57ErWbktbyrU4zZduhjRIlOSQ6f4RY40oY3CbtrKu
         GReQtQpeysWYMkKQlhixBbroaUCrMAQMwdkEtgDxcWomBH7c0swKaghBND82LAIvSelE
         4vNaSETQGmd6iyZxd5FEbC9zo00NL0EbxXJlPIcFbLPA5DChMWBBeYlSL1yb0gfwcAFF
         wYOO99ka8nPfojxq5U5KRYB/ywxq8Y6EmeoSrQv/qjxrh9ILCS3qjcLx3Y/HlhDjHkhe
         9szw==
X-Forwarded-Encrypted: i=1; AJvYcCXNx3FXwG4oPD0ayt9qjw9U2Q1Dchsh9J0EdwlZ5AfRUWeCVfeuLuQI7n5+wSkm+YlnRwXydMBW6F+W3LA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywvv1QoMTziHhz6ofmNFSG6wv30srxyWu5JnAPqH/42Mfkaxx+/
	Bi+mcnf4qPKukhBmO/lZ9Rc0OtJAke48srdAMNl5jbNJplAAkFNYBduyyvkNPQ==
X-Google-Smtp-Source: AGHT+IFW5o76WLto1m5OIr01yojLQTVPsUEplusVOtBKeM+zgF4Mr8Jjm4ekkrZvP/8oEpp3jj7xuA==
X-Received: by 2002:a05:6214:3a88:b0:6cb:35ea:a343 with SMTP id 6a1803df08f44-6cb3b5b60c5mr157899696d6.5.1727697861311;
        Mon, 30 Sep 2024 05:04:21 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:04 +0000
Subject: [PATCH 09/45] media: cx231xx: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-9-81e137456ce0@chromium.org>
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
drivers/media/usb/cx231xx/cx231xx-video.c:144:4-9: opportunity for str_enabled_disabled(flags)
drivers/media/usb/cx231xx/cx231xx-i2c.c:373:4-30: opportunity for str_read_write(( msgs [ i ] . flags & I2C_M_RD ))
drivers/media/usb/cx231xx/cx231xx-i2c.c:402:4-32: opportunity for str_read_write(( msgs [ i + 1 ] . flags & I2C_M_RD ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-i2c.c   | 4 ++--
 drivers/media/usb/cx231xx/cx231xx-video.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
index 6da8e7943d94..6d8b70562f6d 100644
--- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
+++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
@@ -370,7 +370,7 @@ static int cx231xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 		addr = msgs[i].addr;
 
 		dprintk2(2, "%s %s addr=0x%x len=%d:",
-			 (msgs[i].flags & I2C_M_RD) ? "read" : "write",
+			 str_read_write(msgs[i].flags & I2C_M_RD),
 			 i == num - 1 ? "stop" : "nonstop", addr, msgs[i].len);
 		if (!msgs[i].len) {
 			/* no len: check only for device presence */
@@ -399,7 +399,7 @@ static int cx231xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 			/* read bytes */
 			dprintk2(2, "plus %s %s addr=0x%x len=%d:",
-				(msgs[i+1].flags & I2C_M_RD) ? "read" : "write",
+				str_read_write(msgs[i + 1].flags & I2C_M_RD),
 				i+1 == num - 1 ? "stop" : "nonstop", addr, msgs[i+1].len);
 			rc = cx231xx_i2c_recv_bytes_with_saddr(i2c_adap,
 							       &msgs[i],
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 435eb0b32cb1..4cdcfe635ad7 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -141,7 +141,7 @@ static int cx231xx_enable_analog_tuner(struct cx231xx *dev)
 			dev_err(dev->dev,
 				"Couldn't change link %s->%s to %s. Error %d\n",
 				source->name, sink->name,
-				flags ? "enabled" : "disabled",
+				str_enabled_disabled(flags),
 				ret);
 			return ret;
 		} else

-- 
2.46.1.824.gd892dcdcdd-goog

