Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67B3F13D1
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 08:52:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqwSN2g1Zz3bbv
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 16:52:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VYSb21XK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VYSb21XK; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqwSC0zD4z3bZ6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Aug 2021 16:52:26 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id oa17so4316250pjb.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Aug 2021 23:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NEQXEf4GVUYePwDQ1RZTjWtEa+UqsaqgBQduVP4iCuQ=;
 b=VYSb21XKtf84HdXO43QylWSyEvkVP/P1pXT6NpmDDwm3hJwtRw95yGT0NIXLyWeq6L
 4SEkTGoVche1KCM6eE+BvL09FhcayRd7v1YLVXjbx6nHmCOG08TO5n12u7Bu0I0Hg/2q
 QzjhQ1iNZK7CZp3bFlNxf8cj6OR171jWqVWiFjbKG00fkt8LvFiC4jx+rC08ueWCLbhF
 /ds9TS4vId3r3V7ud5vNdwx09UrusCgrT0qbB0a2d7SWWAn4qUL1zhOsiXGC2mSe+TFr
 09PJTZO6dlzk1rKsopUFbkrifR7kBOzE768/pS6CuioEFVOObj9uB3gpIWy+gLC59CaS
 o5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NEQXEf4GVUYePwDQ1RZTjWtEa+UqsaqgBQduVP4iCuQ=;
 b=jC0ymu6vpbluSY1GVtucWsXrmohXt7rzzrQzTx8a5VlH69aXE0v296cTii2YHq59wU
 /mMrKDHbZ4ZBFzfPg1+K97UK4mPSl63lXJ1jqqAvjPJOmidj6eQ3mMIc6YFxVavDEjpH
 wmQ65fqPvvnjg0+MzTQOWvcvT8laXawtbUspi/AXi6Pqq1VnBP4cdM/1MpyFfVS1Oa1g
 jsy4+N0imhp5DeMh+wOwFDGq5StAyNyp27X2iLCZQlMlSu+7fIRER+x3sUWQMNOYr2Vp
 NVhlBMp4o7dVrzDiczvYMxJJdBJytcLF9VhB+Z7WHh3qJriUdk6EWGexvKFsDjtiV0nc
 75pA==
X-Gm-Message-State: AOAM5335rjDqKVylY4gmXu0e0FBz32qpUhpX2wm0mktn9o+T5Ya85tzM
 yyc2qRtXxcam7oHwFBtvx0A=
X-Google-Smtp-Source: ABdhPJz+oT30MtNeAd5eezZzDHw9JUpSFRFit1ZaFwPhCvYz7HM3+s1Dk/q8JzlfPGNVdQfJUbPEPA==
X-Received: by 2002:a17:90a:e60f:: with SMTP id
 j15mr13634143pjy.173.1629355944944; 
 Wed, 18 Aug 2021 23:52:24 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 4sm1860035pjb.21.2021.08.18.23.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 23:52:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 3/4] ARM: config: aspeed_g4: Enable EDAC and SPGIO
Date: Thu, 19 Aug 2021 16:22:02 +0930
Message-Id: <20210819065203.2620911-4-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210819065203.2620911-1-joel@jms.id.au>
References: <20210819065203.2620911-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

These two devices are part of the AST2400 and the drivers have support
for that version of the soc.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g4_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 397c57e94743..a578865c2d96 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -141,6 +141,7 @@ CONFIG_SPI=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_ASPEED=y
+CONFIG_GPIO_ASPEED_SGPIO=y
 CONFIG_W1=y
 CONFIG_W1_MASTER_GPIO=y
 CONFIG_W1_SLAVE_THERM=y
@@ -205,6 +206,7 @@ CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_EDAC=y
+CONFIG_EDAC_ASPEED=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_PCF8523=y
-- 
2.32.0

