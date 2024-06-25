Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FD091678A
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NxUDVxwo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kTY2LKtz3dBH
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NxUDVxwo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSx28lVz3dKH
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:21:05 +1000 (AEST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-24c9f892aeaso2844962fac.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318061; x=1719922861; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+uu0rzbI9pJ3uqj4sfpv2TDkc5Xd8qKMrPrJB5mTeA=;
        b=NxUDVxwoEmL5+ajrDwwUJE8uO09yWB1NJwFRssnWSAFJIme1fcGWq7EMGQPMcowJqC
         4mY3xXeBJDVRpBBeeh3SftJS/QhBbOjvvS6gO91aU00+o6ulTaR9dI3G6Uu5j1T7tC32
         7ofc2qg3NNussZx2pcYfsRN613vwFLbtyhcSZdVL2YbuNKNopbhkLPZURQF5NXDqm25d
         2rkt0RMo+FD9jp5F8Hqn/5o9BAZnokvggGZKrsnUBTWVqtBiADyOuexZj9n9uhqIn0VE
         AvDDwXriApA0SYPFPNRQEoSSCDF0QK6xAWgK5KCm5fzzXVBKSNcpMDdKB6gKbqoNp/Ig
         gF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318061; x=1719922861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+uu0rzbI9pJ3uqj4sfpv2TDkc5Xd8qKMrPrJB5mTeA=;
        b=Anl/P6J5HNPi5uzzbUA2Bx0/sf7psP7H3C5wF50Be4Il08GufG073iPV7et0PLTImT
         FH2jJrux4s9THn/Q/1FBjb6+FOuJcj61QwDD4fERMY8CicDj0RqSYr8Ol9pitNHnmd4h
         I9GGIZesqdOdPlSLXgiIPDSniF04QNKBflQJBFhae58f3ju1EWcVFA/p2LTqiEIdbG11
         Hg/dqmUkVeq2X0GUTGp3fTxDVm2aXQqvkz1L6d8MnpB3WqLMV/ZWVa4Ph85aEfOsgknp
         pnsLHsIoxaBxNymv9Fxf5sDLE3pU0sQK2TnYFkfHifmPNfh89ctQkoe0JuHV4yccvcMz
         s0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZhv1sip/rDNv3/e91h2LCQKmNuaFGRl/Jwfaz5NsdfJ9GTStXAvuJGFMqa1In+BthFjRNxi1BdXbsmGbqYEM75xJpYPVyTdES2ZjHHA==
X-Gm-Message-State: AOJu0Yw+NJ9WAnbaqGqxlEbP+WYEIWOrX4TrNImD7VWFbD1GuaOtfQhR
	1YKL7XPrLwox6sX/8X3tA7EnSRZ+kcv24at8N+ELUabBAE4PVMAu
X-Google-Smtp-Source: AGHT+IFzlgZ9Z+5jCEawQ1SiycpI5lPWJJJD0pvdaDoBayUOkNEUq+4qzUui5ha/KmND4tslTbZuqA==
X-Received: by 2002:a05:6870:568d:b0:258:476d:a793 with SMTP id 586e51a60fabf-25d06c3133amr6758374fac.19.1719318061201;
        Tue, 25 Jun 2024 05:21:01 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:21:00 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 10/17] ARM: dts: aspeed: minerva: add linename of two pins
Date: Tue, 25 Jun 2024 20:18:28 +0800
Message-Id: <20240625121835.751013-11-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
References: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Add linename of two pins for power good/control.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 60beda2737a1..58a083536c79 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -578,12 +578,12 @@ &gpio0 {
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","",
-	/*Q0-Q7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
-	/*V0-V7*/	"","","","","BAT_DETECT","","","",
+	/*V0-V7*/	"","","","","BAT_DETECT","","power-chassis-good","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","BLADE_UART_SEL3","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
-- 
2.34.1

