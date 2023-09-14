Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7254C7A4138
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 08:31:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nyTKP2ff;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpw0q2bH2z3cSf
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 16:31:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nyTKP2ff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmcp91yPSz30gH
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Sep 2023 22:58:56 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bf5c314a57so6978755ad.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Sep 2023 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694696332; x=1695301132; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gbxv4h8Eb+stnFN9n9SZqBKrtaKHgRljtRTslf/2l/E=;
        b=nyTKP2ffmToU6QVO2EDG/tN1Kg0hjx/k0HNna/bTBxKc1D75oHbFfa9I0OrVXqZq0f
         5gESkyjs+A304GjHBP19godUiQyxLUPX9+OQ9leG7EMB5sr/K7vF1NmzfFQnKjwHROIY
         MJnSqclnDaRlVTKn6HKvKE2Utqb+oWnegBp9owXjaWEcm2UjlItNLhnl4o9+vaCrxOTw
         N7S5n74E6uZ10B+TnSnurawBdu9pG1aND07lM+LxfnDHhNVDqmKOIABcgpqbEayYM1Jq
         T6JUZThACLQm3mXAK+8HyMJfB5OEBwuRJ02GpV1oSHkhP9ZWmaAjuMUUDgpmgkN4qxoR
         UlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694696332; x=1695301132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbxv4h8Eb+stnFN9n9SZqBKrtaKHgRljtRTslf/2l/E=;
        b=MNn5Tbg8hhsXJocg3gWC5ia4/eAlM5MZy9u/I0DTH/B5x0RaMqLuqef8u+3GMnyTpX
         kaA13jpazERU6kVSpO+vvicghvyMxKCfngO64jCroER8aNT6OfIDslEM2d6sktAoPbTe
         KNjQqqURAJKEL/BwZnUaXou7L15HFBGKelgUZk3HGEyeK+QOGE49xBkWshEj1xZ7P7If
         uRcoH6msfQRcqpm3ZB1YBBPAIMOB/bftg/B2iO9g1OhXXk9rjGMX15Ap4M3nRFGRWj3F
         rycXoYxAUPNT/1QjFf7CTX06EeUIEiP793rTRZI8UcMiKOLd4+MeYyDH1qkd+YHvrrVg
         CuHw==
X-Gm-Message-State: AOJu0YwGzWul/sg7tqk0uuGsf1FWazgA+OqvEwfwG4BxgnsNgcqTCca8
	/sm9nmCuJcicKoQ9sthmsds=
X-Google-Smtp-Source: AGHT+IHmr8nEWeWKbAswJ+Fi1DDBOh5E/tPwrau6PTlFCxqky+1IVS5faEJr1y2R8r1HkNtOXxUiuA==
X-Received: by 2002:a17:902:b710:b0:1c3:9544:cf63 with SMTP id d16-20020a170902b71000b001c39544cf63mr4994940pls.23.1694696332396;
        Thu, 14 Sep 2023 05:58:52 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id c11-20020a170903234b00b001b8a3e2c241sm1535105plh.14.2023.09.14.05.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 05:58:52 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add CMC of Facebook Minerva platform
Date: Thu, 14 Sep 2023 20:56:46 +0800
Message-Id: <20230914125648.3966519-1-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Sep 2023 16:30:23 +1000
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
Cc: patrick@stwcx.xyz, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, Eddie.Chen@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add linux device tree entry related to the Minerva Chassis Management
Controller (CMC) specific devices connected to the Aspeed SoC (AST2600).

Changes from v1:
- Change adc0 and adc1 "ref_voltage" property to
  "aspeed,int-vref-microvolt" which is defined in the binding file, and
choose the ADC internal reference voltage to 2500000 microvolts.

Yang Chen (2):
  dt-bindings: arm: aspeed: document board compatibles
  ARM: dts: aspeed: Minerva: Add Facebook Minerva CMC board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed-bmc-facebook-minerva-cmc.dts       | 265 ++++++++++++++++++
 3 files changed, 267 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts

-- 
2.34.1

