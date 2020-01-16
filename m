Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B913F00B
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Jan 2020 19:20:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zCDJ729tzDqbB
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jan 2020 05:20:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=xVtVq4AW; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9hZ4nBZzDqYV
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Jan 2020 04:11:26 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4173D24684;
 Thu, 16 Jan 2020 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194684;
 bh=d7cXhq7vMyyCAAxT+hk59hpaupWElbvnm/AH3qUW6Ww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xVtVq4AWHj4KytdFdXivzbIo9YtovVFkcJoROAvLjn6RDuS0/Fimtz49Ol2/PgsmW
 Lq1ZLeUED+WFaDyOCPCbuWTYwthVdQ2LlKFZ5h/mHW9LRT0hMzkApBbMEt8s8ea08A
 sgqCpwfOfV0+tUcP4x3hALsZC7dHWq/9VEpWqTeA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 528/671] ARM: dts: aspeed-g5: Fixe gpio-ranges
 upper limit
Date: Thu, 16 Jan 2020 12:02:46 -0500
Message-Id: <20200116170509.12787-265-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Oscar A Perez <linux@neuralgames.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Oscar A Perez <linux@neuralgames.com>

[ Upstream commit 89b97c429e2e77d695b5133572ca12ec256a4ea4 ]

According to the AST2500/AST2520 specs, these SoCs support up to 228 GPIO
pins. However, 'gpio-ranges' value in 'aspeed-g5.dtsi' file is currently
setting the upper limit to 220 which isn't allowing access to all their
GPIOs. The correct upper limit value is 232 (actual number is 228 plus a
4-GPIO hole in GPIOAB). Without this patch, GPIOs AC5 and AC6 do not work
correctly on a AST2500 BMC running Linux Kernel v4.19

Fixes: 2039f90d136c ("ARM: dts: aspeed-g5: Add gpio controller to devicetree")
Signed-off-by: Oscar A Perez <linux@neuralgames.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d107459fc0f8..f2e1015d75ab 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -247,7 +247,7 @@
 				compatible = "aspeed,ast2500-gpio";
 				reg = <0x1e780000 0x1000>;
 				interrupts = <20>;
-				gpio-ranges = <&pinctrl 0 0 220>;
+				gpio-ranges = <&pinctrl 0 0 232>;
 				clocks = <&syscon ASPEED_CLK_APB>;
 				interrupt-controller;
 			};
-- 
2.20.1

