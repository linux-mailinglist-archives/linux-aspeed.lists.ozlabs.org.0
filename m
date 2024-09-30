Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 480A398B04B
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkh3fW4z3g4f
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697901;
	cv=none; b=bVuoBBEzZbpB5XaI8HqbI3bzlil8qrQ/ZzW7Uh9H5vlNVrUjsmop9oCzfA1Rptivynz4gjI5hE/FEVkgRUN/KX8HDTxMlec6BKRs8x+/Ct+zgmx//XUgwFVYQ/MXGebg8IEOOkqkJgAIgsT5SdvRnmY79ysgdczbhR7Nr618nDxnDDhzHit7gWbhumjwbbyvBIGgXCovPoVtyX9WyU0l/cejtLXIVC3vgjnzawYMQwlLohpc2ICQP8iQRDiLfERV2ekl1WOowlRY3QHe7QeoKBFUTPrzlo/gQ/4EUUyB26f3KAk7BXU2HXiiCucm4GtT+K6wmyjekRJXFtRReFNItg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697901; c=relaxed/relaxed;
	bh=w+lDXyICIHcG+x83IY7Td9H+I+izyCveuIAoXyx8Crg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6ETwkimJhxOnvn4VnCaz6CVpVcQyHfskCmKxOU+Eiko+eLS5RT5G2anSHYH5PXlWSYzAoW3j21HqWh85N8iTsOGOdKC8pgFAM6brdJSe2UtGtF5G+WKE4Zls4yElWMcMOQpu87MSKplokMCtM9TWfA4ELi2RMixnreM7VdaklCBmn/QohccS0BHerTD9Emu23aA3fZ/vyObIe4BJ8Xbzh2y0LeuYy9d70c4bwDs6pfDQqATCm3feyPwYouI9AH9fAy8HOL611FzWZy6oU6il+JYRhRTCkgLacLOk6hzDFJ4r1MYSU/NIFr8NJ6qeiMmuKnYzZjcs1xW/szHwrQE5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MaKsPAxp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MaKsPAxp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWd2Vcfz2yXd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:01 +1000 (AEST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5e1c65eb5bbso2298046eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697899; x=1728302699; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+lDXyICIHcG+x83IY7Td9H+I+izyCveuIAoXyx8Crg=;
        b=MaKsPAxpuOSCfgyI1lW8jzsskO8KO6E8px53xqp0jkMiRTFl5+CdTSDuOrcqiA7ezj
         J1TlXuoH82SBl2vQtsU8k4Jp6If+DgzPw5AIpcnG8JL1+Hwxmnd0qmBQJkUJN4jxO94N
         j38YwxKucvplLCz+/J8oyWulTfOVjDzOhxPSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697899; x=1728302699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+lDXyICIHcG+x83IY7Td9H+I+izyCveuIAoXyx8Crg=;
        b=J7rdMM/Ytg5obeTRh0fER2GKmWjaREnUe+HYiWodQP6hBBb5PtrV/WcoiAi+kNWOk+
         8PjkEYgjXFKBu0es/n10xdAUpIxxBzFoUNBG4/jSWBl7pOMhkB2+mv+1h7JguIj8QHTa
         RMANMnp4B7oi+FIvpL56iPTNhcjseljzYrQdKG6SeYZhWlRoQixdCVPkQ66U2vKuiDXr
         GdAjgY7nTGnJw1JQxkvFIoUBwqdMLk9krdoHpsDFqZWYKZ2E7Vgo8VeXIJY6Qs6E/mrj
         f6Kagvhc1PaBmd4K+mIZGontaqoiv7eqmvVmrNq59xQpda+hm+ZMVbQsmEBqKqHztNKK
         aV9g==
X-Forwarded-Encrypted: i=1; AJvYcCX+5uigjQ/bZh1hKzTjCpfcB635P6AdDYqwgvbO2XddUyokSqTCQCFecm3G6uxGAEuLmUbCAy0d9XkjGq8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzo92tKgYHBU4Ks5RZ1LOOL8oOy9B4x1VgYGR4A+1fVAtzrxfWW
	ZuSbc/9ITo/N72tZZ92NZpy+uWJ2fEArPiGxskF+SmRbApKmijaHoQLHbZg5rA==
X-Google-Smtp-Source: AGHT+IHpSAOikj0Pw9qUy/ufav5/H94vhYgLdOZ5ZWws6VuRg45Il/9rM3D70mqQT4nS8RcavrRJ/g==
X-Received: by 2002:a05:6358:7254:b0:1b8:322e:3db with SMTP id e5c5f4694b2df-1becbc887d8mr566945055d.14.1727697898629;
        Mon, 30 Sep 2024 05:04:58 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:22 +0000
Subject: [PATCH 27/45] media: cec: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-27-81e137456ce0@chromium.org>
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
drivers/media/cec/usb/pulse8/pulse8-cec.c:698:2-9: opportunity for str_on_off(data [ 0 ])
drivers/media/cec/usb/pulse8/pulse8-cec.c:705:4-11: opportunity for str_on_off(data [ 0 ])
drivers/media/cec/platform/cec-gpio/cec-gpio.c:138:6-22: opportunity for str_high_low(cec -> hpd_is_high)
drivers/media/cec/platform/cec-gpio/cec-gpio.c:141:6-21: opportunity for str_high_low(cec -> v5_is_high)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/cec/platform/cec-gpio/cec-gpio.c | 4 ++--
 drivers/media/cec/usb/pulse8/pulse8-cec.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index 98dacb0919b6..49160a15272b 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -135,10 +135,10 @@ static void cec_gpio_status(struct cec_adapter *adap, struct seq_file *file)
 	seq_printf(file, "using irq: %d\n", cec->cec_irq);
 	if (cec->hpd_gpio)
 		seq_printf(file, "hpd: %s\n",
-			   cec->hpd_is_high ? "high" : "low");
+			   str_high_low(cec->hpd_is_high));
 	if (cec->v5_gpio)
 		seq_printf(file, "5V: %s\n",
-			   cec->v5_is_high ? "high" : "low");
+			   str_high_low(cec->v5_is_high));
 }
 
 static int cec_gpio_read_hpd(struct cec_adapter *adap)
diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index ba67587bd43e..0167f21cb116 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -695,14 +695,14 @@ static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
 		return err;
 	pulse8->autonomous = data[0];
 	dev_dbg(pulse8->dev, "Autonomous mode: %s",
-		data[0] ? "on" : "off");
+		str_on_off(data[0]));
 
 	if (pulse8->vers >= 10) {
 		cmd[0] = MSGCODE_GET_AUTO_POWER_ON;
 		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
 		if (!err)
 			dev_dbg(pulse8->dev, "Auto Power On: %s",
-				data[0] ? "on" : "off");
+				str_on_off(data[0]));
 	}
 
 	cmd[0] = MSGCODE_GET_DEVICE_TYPE;

-- 
2.46.1.824.gd892dcdcdd-goog

