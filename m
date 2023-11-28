Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D17547FCBA3
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Nov 2023 01:43:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=t+chuYK0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg0tF2Cf1z3cgN
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Nov 2023 11:43:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=t+chuYK0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rnplus.nl (client-ip=178.251.25.70; helo=mail.rnplus.nl; envelope-from=renze@rnplus.nl; receiver=lists.ozlabs.org)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg0t60Zfjz2yV3
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Nov 2023 11:43:05 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id AEE69379445
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Nov 2023 23:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id noa149ymQYJJ for <linux-aspeed@lists.ozlabs.org>;
	Wed, 29 Nov 2023 00:26:46 +0100 (CET)
Received: from werkpc.lan (87-101-2-254.dsl.cambrium.nl [87.101.2.254])
	by mail.rnplus.nl (Postfix) with ESMTPSA id EA6B0379434;
	Wed, 29 Nov 2023 00:26:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1701214002; bh=oZJLJBZAx0MsbUik85ITPZJyjd007ov2TZPI2l716ic=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=t+chuYK0s23tsOzFeP86CZqe/UWh7fxBn61MmxnM8NQSgv7FlQyD7XplKDja2CRWq
	 pwxBuwRREswGTpsG3ZSFDxZYebtsCIGzoMIvXnhKAVYG436dN4UOcEIMFQAnLqa5uY
	 D/4Zl+DH1DMnYd33gZZ2yWPHJogmjPqNyDAXZeDw=
From: Renze Nicolai <renze@rnplus.nl>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	renze@rnplus.nl
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Asrock X570D4U board
Date: Wed, 29 Nov 2023 00:23:16 +0100
Message-ID: <20231128232456.2932350-2-renze@rnplus.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128232456.2932350-1-renze@rnplus.nl>
References: <20231128232456.2932350-1-renze@rnplus.nl>
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

Document Asrock X570D4U compatible.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 749ee54a3ff8..81ed678905fa 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -36,6 +36,7 @@ properties:
               - aspeed,ast2500-evb
               - asrock,e3c246d4i-bmc
               - asrock,romed8hm3-bmc
+              - asrock,x570d4u-bmc
               - bytedance,g220a-bmc
               - facebook,cmm-bmc
               - facebook,minipack-bmc
-- 
2.43.0

