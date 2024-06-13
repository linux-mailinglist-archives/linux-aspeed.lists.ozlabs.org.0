Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC42907693
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2024 17:27:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BJNYnSws;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0R8w3vMjz3cWc
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jun 2024 01:26:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BJNYnSws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0R8b5Phjz3cVd
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jun 2024 01:26:38 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-36dd56cf5f5so4336395ab.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2024 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718292393; x=1718897193; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jm/6BzaviY1u0xnF4/R18zgtmNVNPYtnZ73QHOb7/dY=;
        b=BJNYnSwsO7tvVvm4asldC55u8jldUnuvuWno+Nh7oOkNpLEoC4gatw1Pvv7wqRviCR
         L8eMu+XmaqBjkcNrxdFORCkzn/qc98o0WPYqiUdJGkrmN0prG1RH71EBebP1rSRDg2ir
         gGvZbgHRVnzQa114cqmM/8bL8a6yVyzJThj6lPnbZ8lpTkh9IMaO1P5jnXkYRGwxRgta
         j1GUx2r51MVZyXCpI03lu3W6/xy0o4NumCnE9tz0Zv4Js4W230AfDNDgqNKMHFhYDfud
         w7A00QhLWJzHwEa3HJ+O6rSwDHaSpmFLk1l1oLF06JD7Mfl/gxkgE3dtn+qwB6G3OzPH
         U3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718292393; x=1718897193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jm/6BzaviY1u0xnF4/R18zgtmNVNPYtnZ73QHOb7/dY=;
        b=rMdyFdV9wdIX2m/nqt/s/z1ugSgLIzazWzAk3Q5JgRU/OJe9Sv3H6QhqFSvpG4Cxcr
         kewnGvJnAYqkgaOmsFV2Wb4fauQI9r0OxWNgNkq/0lPZyCcJ+qLpTTuc2HHATpTmizEM
         79ONngBjXdcIlv43JyzWSsqLsSOu1ZJ0NBixI+MWLRujbe5CgJ3PyEGw0HTn7y3q3Fhe
         5iOaX3Umc47W5yxZwSpNpWSRd6qNF5XYSDLtwUzd0CvroqR1leJz+cqVOmGOYZZz98ek
         lW3SGW2sG25d6swZtmh74vZt/mRBGPopo88DsY8WAeV6CRZYyUOts9AMqJ8jGFQdpayz
         PNWg==
X-Forwarded-Encrypted: i=1; AJvYcCWB1VfSu9axXP2GZVdwzT0mmYGO3OIsrdRln63Hfr7h8+gZvLIoB2okDzv4mSCO8tG3ZdXORue9C7Jhj71jupV5jPOS6Is+gf76JLaq5Q==
X-Gm-Message-State: AOJu0YxRt5YqnTb5pBeDx3fpnKWNgp0Q3vid6ntSns8IqF/j3noZwQSx
	HPCdQXXrr0M1RaX6w9O9uWuD4lnvOdgWv8xOnCTZDwDqkT1wH3CL
X-Google-Smtp-Source: AGHT+IGa5DsLl/zZLbHkZItPNrjZHZht4Iydu4WtmU5bEERKH4wR+X+/U/92szyeUtIbFol0T8qeWA==
X-Received: by 2002:a05:6e02:1544:b0:375:9ecb:acd3 with SMTP id e9e14a558f8ab-375cd14a6f6mr53447555ab.9.1718292392615;
        Thu, 13 Jun 2024 08:26:32 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee41663d2sm1198183a12.92.2024.06.13.08.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:26:32 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/7] ARM: dts: aspeed: Harma: revise hsc chip
Date: Thu, 13 Jun 2024 23:24:19 +0800
Message-Id: <20240613152425.1582059-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
References: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
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

Revise HSC chip name and address to match LTC4287.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index e7f4823ca4b3..0d349ce1f3e6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -276,11 +276,10 @@ temperature-sensor@49 {
 		reg = <0x49>;
 	};
 
-	power-monitor@22 {
-		compatible = "lltc,ltc4286";
-		reg = <0x22>;
-		adi,vrange-low-enable;
-		shunt-resistor-micro-ohms = <500>;
+	power-monitor@44 {
+		compatible = "lltc,ltc4287";
+		reg = <0x44>;
+		shunt-resistor-micro-ohms = <250>;
 	};
 };
 
-- 
2.25.1

