Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D34288C618
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Mar 2024 16:00:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wp9oJFk0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3tKF5Dyqz3vZX
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 02:00:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wp9oJFk0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3tK40qFnz3vYt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 02:00:39 +1100 (AEDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-22a639aedb6so344341fac.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Mar 2024 08:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711465236; x=1712070036; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ep9QVOB8/YOpGWyRSjZf2H1PYHwu34pwGLtmpze6dGw=;
        b=Wp9oJFk07DuQd7dmXFwWpatqCVO5ggg0CBod8izCJIC5/oAQeLqsKvgIlUjt9zNswi
         B4vre+pb+Ept39O3q0CCN2Pr8isMexFViVz6fl2W1dGyzvYc6aDEeZGP2zBcBIgmHgYC
         4EdlJ163M78ZW/gU7iDY7nWfKBdSLkKqwOCc4++2VGicGPXRElkhEEg94BgZWu12NRwu
         8zos40yvJGwNXHqyKb24TXwRxGCGWxBlrnJ8I0MRA8rk+xpOHQIQDwjnv/UOGIFxzM6A
         TppvzNTV8HoGEcBqK8jJ5hy6NUGnsme+BDUqFL6IIkw/9Y3esc/fDatod9KQRQd4VwQk
         zgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465236; x=1712070036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ep9QVOB8/YOpGWyRSjZf2H1PYHwu34pwGLtmpze6dGw=;
        b=m6Gfuu4kU0glvYIya8Scoj7hbKoRvJUQplweyPQAFL5oa+8iEwUYeQR6YHUpV+J+SA
         bNm+qIDJNhHupogylvr0i+tDHpyRG8ur1rBhkoKyG7yf0ZRq6GkeRP9alBGGED8qNwc3
         FAoBtY/r9b7OJ4vc7t5DNDFGM4uas3iAOz2uTCbN4Hfchek3H7QxeTgiMbMKGFctPW9r
         8OkRn9ZoCWerg/sVTWA4YUvb6Le7LeVIr9C9zqhubVVDtnt60+z0oaTOSYec0V2Tsqlg
         VhCmp4Qr+2KgMTMod5uRr1OnrrCS2WRgoUFzOWHdGbXcticWl0s1uQMHLsQCm/0rAU/v
         +fog==
X-Forwarded-Encrypted: i=1; AJvYcCWt9Yg3UtJOm/UAutm6KqJ2fO+yX5DugG7Ddf83l9vLgMgyZ8WPToGQHdOrLi5c42YHJaA7dy05zdSaeAhFqRfkth4xR55FXqxKLg5Pfg==
X-Gm-Message-State: AOJu0YxJXEFzOGNCB9YvMQJfoTEPgv2yDsS8uDFgWfg//1Y4FxIkfW+e
	X+l8Aujq75b20PUAgsML0LZrbt/RBuoFWYZc4c6tZaut3jFs26FY
X-Google-Smtp-Source: AGHT+IE9lJtqRc0RFeoGBEWVBCzB5/BipthG8IbTBUUZW2xqn5DBa3mtgCMrQYxtY/j1pt86sk3CAg==
X-Received: by 2002:a05:6870:50:b0:229:f1be:c73e with SMTP id 16-20020a056870005000b00229f1bec73emr10049326oaz.25.1711465236132;
        Tue, 26 Mar 2024 08:00:36 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id l27-20020a635b5b000000b005dcbb855530sm7658404pgm.76.2024.03.26.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:00:35 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] drivers: watchdog: ast2500 and ast2600 support bootstatus
Date: Tue, 26 Mar 2024 23:00:23 +0800
Message-Id: <20240326150027.3015958-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add WDIOF_EXTERN1 and WDIOF_CARDRESET bootstatus in ast2500/ast2600

Regarding the AST2600 specification, the WDTn Timeout Status Register
(WDT10) has bit 1 reserved. Bit 1 of the status register indicates
on ast2500 if the boot was from the second boot source.
It does not indicate that the most recent reset was triggered by
the watchdog. The code should just be changed to set WDIOF_CARDRESET
if bit 0 of the status register is set.

Include SCU register to veriy WDIOF_EXTERN1 in ast2600 SCU74 or
ast2500 SCU3C when bit1 is set.

v2 -> v3
  - Fixed WDIOF_CARDRESET status bit check and added support
  for WDIOF_EXTERN1 on ast2500 and ast2600.

v1 -> v2
  - Add comment and support WDIOF_CARDRESET in ast2600

v1
  - Patch 0001 - Add WDIOF_EXTERN1 bootstatus
---

Peter Yin (4):
  ARM: dts: aspeed: Add the AST2500 WDT with SCU register
  ARM: dts: aspeed: Add the AST2600 WDT with SCU register
  dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
  drivers: watchdog: ast2500 and ast2600 support bootstatus

 .../bindings/watchdog/aspeed-wdt.txt          |  4 ++
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi       |  3 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  4 ++
 drivers/watchdog/aspeed_wdt.c                 | 53 +++++++++++++------
 4 files changed, 48 insertions(+), 16 deletions(-)

-- 
2.25.1

