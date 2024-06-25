Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B47916784
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OOnJwrMn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kTC35vhz3dBs
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OOnJwrMn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSm3RtWz3dK5
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:20:56 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-706642b4403so2177663b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318055; x=1719922855; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnsLFvvKnkuLIEYBYSGcmnnHIoHb+QjNTsPSZ0S+a3o=;
        b=OOnJwrMnhQ61kqciNwq55AR8/UDyHxlNUqHndn+9sJ1x0pznJvRXCPkAxuKS9DNuFn
         7gYvmbyDKkJRt37ajiGZtf50FB8Mm4Z//jGDzTlQDQFzpzlCCLdPiw9BVFQ+PP/3W9dD
         gLTublX3p2hIlKbO9lPOGMqOnu7s85LXt3nT/aVewsJwf/UWcb4v8wlBfTxlFcIv7TvQ
         EU58bGlOxTZTKFS9+3VLgFSQRRl4VpwRdeSwjzLpXBRvKmUnWEyjtjtQK1nXQuH97oVD
         Q5RsJh8hxIvMuNrjo8nq9gR+6uUs+ncohMU2fBMumeNi98d+6mu5fHvOwqKdfUdO2p1Y
         2/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318055; x=1719922855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnsLFvvKnkuLIEYBYSGcmnnHIoHb+QjNTsPSZ0S+a3o=;
        b=eADjYBIaXbeXUlgdD7hdeNniBauuQHI2gV1vhK8TjswqVzxWozHsL6gSI+HCrcBxe7
         jk5P0wNFL8kdXNOgTTsvolqihpZKGMd+d/r9HcMNPAVeRYU+c+penkv7cXa1SfICwyeX
         lvW9k9Ccsy1/r+dVDSYHD2Kc/ZMOgt3OWb4+7gLxMTyYJ51rzCnNnaBpV5MJ+WSx3q2l
         xgNxwLMTgeqqUAmv5dPjKBvZpM1UzcO70GLIWLdWft5jCpMgKm3N72X3EnK81PuoBApV
         S7Rc4Z3dr/Yqi/+7CgeFbP59ARDRoXKQBDsHUG/FC4+zcmWwOW7NVSYG2/AtfuTJvXvv
         N1mg==
X-Forwarded-Encrypted: i=1; AJvYcCWELSRnLrvV5BfzwsJ/Cxybi7mzXc+N4s7cp00qEUcZQnAOBENM8t2sejBYVmdPtMxkp6cYVu9ORfX06bOvH+WenwGb2FD8rflU3rEhUw==
X-Gm-Message-State: AOJu0YwtsoE7GGQqAgl5O58CX3Nhin2IJLFHjRMSvLdUrrhQPt/aclnA
	kR7oYM9OdbWD+1+CNThT65WtcksI4IdtsJQhn2dOrvHAW3qwejKS
X-Google-Smtp-Source: AGHT+IFG02b15F29ywDsOysrQbOuQkofJIJGxS0Uwd9bSBE8/lC5gO/YXSe8CYc3kdE6bpQiugt1hQ==
X-Received: by 2002:a05:6a00:1d8d:b0:706:79fa:37d1 with SMTP id d2e1a72fcca58-7069145a734mr4696954b3a.17.1719318054585;
        Tue, 25 Jun 2024 05:20:54 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:20:54 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 07/17] ARM: dts: aspeed: minerva: remove unused bus and device
Date: Tue, 25 Jun 2024 20:18:25 +0800
Message-Id: <20240625121835.751013-8-yangchen.openbmc@gmail.com>
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

Remove unused bus and device.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 4d67ef29023c..a80c46c1962d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -336,10 +336,6 @@ rtc@51 {
 	};
 };
 
-&i2c10 {
-	status = "okay";
-};
-
 &i2c12 {
 	status = "okay";
 };
-- 
2.34.1

