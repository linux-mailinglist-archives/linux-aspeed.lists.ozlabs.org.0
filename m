Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EACE29181A4
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:05:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=njjEfoLQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQC3CMlz3cQf
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:05:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=njjEfoLQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQ10j0Gz3cSy
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:05:44 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1f9d9b57b90so44888745ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407143; x=1720011943; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwLRvqkTKJTXMBBbAKtuEYSjWz9CZpPrtmi6SvMMZc0=;
        b=njjEfoLQO/kcMHz18khwM+6t0n8Xpw3n0mrvTZN9Upg0ynNyV6G+CVEsPoO+6ayU/k
         eUHXGeri0DUeau7Tno6iI0emre6NwGQ0b47ShEvEek94sg+EMuc+5G0K2CEur+QNJ6wn
         +vCU4aZsXgALHHD/ICHLheJmRFZ+GkLOBKwWhMjovXdvaiTZAniGIx6NGGXjaf8ujChV
         Ck6n4RooMUyb1u7jqoI0RDhYGC5qbvJXbaYF0UKPaGrJ7l6V/exx+/2+YDJPH2pSXGU4
         VD805pvjW/Rg6KJLNtH9QAK3M89XkSRrHJxGmQeyOrPlL94jc9SgT9mQH5zKKdcRk+Iw
         wYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407143; x=1720011943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwLRvqkTKJTXMBBbAKtuEYSjWz9CZpPrtmi6SvMMZc0=;
        b=Nrna8OOGzWK9cp51DK3VOlBoLFSfkjD5BvZpheA6j2iSLEMR7/l0jHy8H/ozXQBi12
         gkniB+HgXWIk7MERthgbj624u9CsVGFv9x4p8KEp9hk7SipOPmLBZs3JrwnUO5b2668J
         xuHB1irmjJiSzmj+K+hvvBw5b6mwiaLOoKpW+Ba7oojifoDCyUI5KpvAlDjvBUtaPn3l
         vMpxUIbB3CxXDGOdrr9E4fHrw8xnb0ko2zFbrj77+CXMv5J00ycDZOqK+KPP3nbW+WiQ
         EQjvIARb0AoWCI8k5/a36rwVwE/evU5mWLBFAyUHkc7KUHdVY92sHvH90uC3fagDlJZJ
         ZgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXchXUmJ6XkNhYqWAIHCXujVmGtgOKkc9YDJEsWAX7HJ4+Qv2lOzFbDeUmngh4eZ//COL7/DWNFmCPgg4PTu8uWAt7kgCCJSYnV1+XX4Q==
X-Gm-Message-State: AOJu0Yxzaz6nnu/ytx7qy9AbxrSdSqG5XcOvsjkzyKKYePpEeyaKNXc/
	cgUqHhOGPpEMQqZ+affnAEozdRWJR3lqy4k+tUE38j4qYDT6J/6+
X-Google-Smtp-Source: AGHT+IEMJa7XMcgEXmYjitMuEjQPUMYdDdat7TumJMvXRj8VCcU3DEP7Jd1tgcM0j09sXKozb0rYRg==
X-Received: by 2002:a17:902:d2cc:b0:1f8:64e2:73e4 with SMTP id d9443c01a7336-1fa23ecacd5mr149796295ad.21.1719407142076;
        Wed, 26 Jun 2024 06:05:42 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:41 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 02/17] ARM: dts: aspeed: minerva: change aliases for uart
Date: Wed, 26 Jun 2024 21:03:17 +0800
Message-Id: <20240626130332.929534-3-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
References: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
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

Change and add aliases name for uart interface.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index e20e31917d6c..ca3e417d2c7e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -11,7 +11,8 @@ / {
 	compatible = "facebook,minerva-cmc", "aspeed,ast2600";
 
 	aliases {
-		serial5 = &uart5;
+		serial4 = &uart5;
+		serial5 = &uart6;
 		/*
 		 * PCA9548 (2-0077) provides 8 channels connecting to
 		 * 6 pcs of FCB (Fan Controller Board).
-- 
2.34.1

