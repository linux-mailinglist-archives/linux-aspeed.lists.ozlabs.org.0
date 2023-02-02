Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBC4687722
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 09:19:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6sBx4rL3z3f3d
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 19:19:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yR0zznsS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yR0zznsS;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6sBp4Fx0z3cdv
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 19:19:13 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so4846259pjd.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 00:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BSLvoWKFIHzwbiFrmh/N7Zqs+NmVx/mQp/jfLVij8Fo=;
        b=yR0zznsS7cpKWzf5jRRu1SGs5mdFv/ROA4gWJHdcf2U0ApQBKMCTIx7XJTvfyIhYx7
         z4ZU+Wb8T/vM5vYb4/8lzB8hrv0hA4AyIZLJLJKteoRUwHCREgIqN9434HXAXY0iCRVB
         ew05JPjLH1iedjt1pKPYk1qWZeaU1ybOS0C5znbVTEoDJiHSnoPmpsUE1YvA6FQgsJyz
         vxj+xfCfPD0x3avfnnqNxuPXaPwST/M1hCpiPAJtLU0daE3NUFKGsngr+c7Uwm5Nd0Xf
         GVAEwM9ozQ5XrzKfjU7heQNNdZR+iYLwPv7gH4vy2hRjXEwfTV0dqh0RksQSr4vqmvNd
         mfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSLvoWKFIHzwbiFrmh/N7Zqs+NmVx/mQp/jfLVij8Fo=;
        b=N8XFJ47xhlFrlkTXlKl+/qM2SWGPmPQiIp2cVxEZ1xfjLZoJm/cxOtknSXdxq7QQok
         oBISm9WLQq7Onsv4Wm6a4rlpWiVvKtwo/hl36TJ0sZFicM/yl37/u+CPaxk8Q2L/veb/
         uK70o7RVBWZrMWdmQ0n00NDZtU60AqyfLEwDLZ4xcPinG3RThBw332Jg71EIJHP4kSGM
         B6bUci3fC5Q45ZFA0bVx3G4UQOW9Aet6bczPhGcePXRL2wLK1d0oSi3k3YpS1BM9d0GJ
         mo/EN9SpUGoq788kRO2idwVsOqEtT1/IoLE5xv/tsVMydNHKl2n2SS+dmILxqgF/gJWg
         OyCQ==
X-Gm-Message-State: AO0yUKVMPIVflqjEaqUh5ttlykDvZjF7K5Rf40RbgpfKeJ7sX79IndsI
	8JcRR4U+C7oY1KO0GLUyicV//Q==
X-Google-Smtp-Source: AK7set9hjfIzs5B04/10d95IHbHrAEAa7w/n9b2kPsEqjrWUVEguQhrMFdHHr8eu1oqizGH77mcqXw==
X-Received: by 2002:a17:903:24f:b0:196:3db5:c08b with SMTP id j15-20020a170903024f00b001963db5c08bmr6596565plh.69.1675325950749;
        Thu, 02 Feb 2023 00:19:10 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id y9-20020a1709029b8900b0019324fbec59sm13187552plp.41.2023.02.02.00.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 00:19:10 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH v2 0/3] Add Ufispace NCPLite platform device tree
Date: Thu,  2 Feb 2023 16:18:40 +0800
Message-Id: <20230202081843.2358-1-jordan.chang@ufispace.com>
X-Mailer: git-send-email 2.39.0
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add Ufispace NCPLite platform device tree, and add the compatible
string in dt-bindings files.

Changes for v2:
- modify node name to generic one and check with dtbs_check
- send-email without confidential mode

Jordan Chang (3):
  dt-bindings: vendor-prefixes: Add prefix for Ufi Space
  dt-bindings: arm: aspeed: document Ufispace NCPLite BMC
  ARM: dts: aspeed: Add device tree for Ufispace NCPLite BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ufispace-ncplite.dts  | 359 ++++++++++++++++++
 4 files changed, 363 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts

-- 
2.39.0

