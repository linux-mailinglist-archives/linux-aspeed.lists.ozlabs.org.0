Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A6919FD1
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:01:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g82UhX/v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qGx4yP0z3cFN
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:01:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g82UhX/v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qGG4tkPz3cXK
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:38 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1f9c6e59d34so61901705ad.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471638; x=1720076438; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajViM2jGRh1ABanPLV3vCUCQ26Ko5QKn2UQG+HIRUz0=;
        b=g82UhX/vDh5dp5lspYS7im72jVVbuRFEteMhMx6thjtFR/i2Iaj8WDBQqG4Fad5jdQ
         eIFUdNz3KWoj0Ue9LAFq0sAeXpyehvecHaXkALejF576uBAH6nCMYlmd8o5wBC7GPHP9
         fowoG/G1hlSacwGVl7haqXvJ830vOPrkRiEIqYsfKZ3IVTnv7P2pbLU2wGDfi2m4eT9V
         Kffit/xItkM787YXn6+0iqHXEQpQnVerDtaCPgvtnDDD/gARfi9K2tPVliGCkc23ZwNJ
         IHjFYLaLRG42RLxzfYMd+tRQPPxIsDsnocgbe7Q874YSX0CCOP3yIe96sZ+ZZZgf8M6f
         SmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471638; x=1720076438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajViM2jGRh1ABanPLV3vCUCQ26Ko5QKn2UQG+HIRUz0=;
        b=jUpPPmdP4J7TTAnQWHivU0cqAnFOIIw7stQRa7kDEI8pmuHJWwQFZ4XZ92ee3I6l6S
         1XhAHa1+Sw0vu1cwRL4j8Un3m5R9IQhjGMBvc8St8nRu8s+Ub6MjMwjAwnh7bpWkPlF1
         ACIX7SvA2xTR2vjaHK/e02bIma5PJlSrf3Ljhb8puC92CQro5L9FeIREJjwbiIkPwo6i
         P1TVFSvIzqOkNv5PGXS/DSPO+PMub4il0WojIqmR73T91uqwf/RdP0zURuDvDWhQXgiS
         J0Ho4ixc/SCokJ5ueP5kQXzR5CHu/OkqOK3NycK1JEuPNE/D7gQylryMU9D8wy4a1bh4
         fbvA==
X-Forwarded-Encrypted: i=1; AJvYcCUGEy8PzZiXY1OXzwblAmc87qLKKibGTjtXgCUoT7ZNmvKm/J2wrz1hDlAMO9EfYg8E9XABL5FDUqpblcD6hWGBpaOdETQKI8yxB+PZag==
X-Gm-Message-State: AOJu0YxmgJJotn5w6vohmBDw6hy5hB48aVAGpTdvc970NI3kaOo6dMk1
	aYB50xdmahfNivJJ0TlyA3+sWQBs1z1dFmwJfijwTOqK750qMHr5
X-Google-Smtp-Source: AGHT+IETBCx5YCEJZX39L9A8AQb9JDdAOM+gY+JVJVtM+N7VYMYx/ch/4bo//zcOjJzbBVgkPHRJ2w==
X-Received: by 2002:a17:903:22d2:b0:1f6:fbc2:526f with SMTP id d9443c01a7336-1fa1d52ac13mr158017315ad.32.1719471637939;
        Thu, 27 Jun 2024 00:00:37 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:37 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	amithash@meta.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/10] ARM: dts: aspeed: Harma: remove multi-host property
Date: Thu, 27 Jun 2024 15:00:08 +0800
Message-Id: <20240627070013.2509150-7-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
References: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
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

Harma is single host, so remove multi-host property

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 77eaa89b5eb5..e10ee54fe472 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -137,7 +137,6 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii4_default>;
 	use-ncsi;
-	mellanox,multi-host;
 };
 
 &rtc {
-- 
2.25.1

