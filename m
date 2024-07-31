Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7494361E
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2024 21:14:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YawNJ9oZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ1x910pZz3dLY
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 05:14:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YawNJ9oZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZ1wR1v7Vz3dJV
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2024 05:13:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D59D1CE17EC;
	Wed, 31 Jul 2024 19:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4607CC116B1;
	Wed, 31 Jul 2024 19:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453221;
	bh=+jskVYz4RvJQMTJu5G7MN+BNF0iQeceivR3RGFlI1R0=;
	h=From:To:Cc:Subject:Date:From;
	b=YawNJ9oZXyselFYCRQcg5njQBjTr/DIvwQQFn2kOLnx3s80hhJet2mN0KQIoF12ep
	 6MXH0TZW6nvxrReZkr4GgWCCr5j3H9iobNbkb9Nr4R2nNM2sgcCsnYBFrwX7otk0W2
	 q68/UocCL4Iow0UNYAbYogw0y+LE1SvKJynxC4RDU5+TGlFM/s1ho0WqJpjrK0rrVm
	 ufPxoQhVWvCm/3WNAiLdAvBGIpF2K7/+Ci7k135pNPoRWswnjqblRr4bG4DZRjpL8K
	 uLj5reFf78C6VSO/7ONAdRfwYFOvB5kqSVevkxO1pR41cVWuyA8mxunbdC+xN4ZlHH
	 ErKQv1YdVxPag==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH] iio: adc: aspeed: Use of_property_present()
Date: Wed, 31 Jul 2024 13:12:43 -0600
Message-ID: <20240731191312.1710417-5-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: linux-iio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use of_property_present() to test for property presence rather than
of_find_property(). This is part of a larger effort to remove callers
of of_find_property() and similar functions. of_find_property() leaks
the DT struct property and data pointers which is a problem for
dynamically allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/iio/adc/aspeed_adc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 090416c0d622..064cddaf6399 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -555,8 +555,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (of_find_property(data->dev->of_node, "aspeed,battery-sensing",
-			     NULL)) {
+	if (of_property_present(data->dev->of_node, "aspeed,battery-sensing")) {
 		if (data->model_data->bat_sense_sup) {
 			data->battery_sensing = 1;
 			if (readl(data->base + ASPEED_REG_ENGINE_CONTROL) &
-- 
2.43.0

