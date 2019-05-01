Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633A10F59
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 00:49:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vYW74V41zDqPR
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 08:49:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="L9oD284U"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vYW16PYPzDqNR
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 08:49:49 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AC2B2DE3E9B
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2019 17:49:47 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YGpyRjbN2zed for <linux-aspeed@lists.ozlabs.org>;
 Wed,  1 May 2019 17:49:47 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 187F2DE3E97
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2019 17:49:47 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 187F2DE3E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1556750987; bh=0ab1U5HbfkPxIeFFmnFluxk2cTL5IqaaajNdvym1On0=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=L9oD284Ufh7Meht5w2OWSZl8zl9TWcz2XDJj/65KkTDDFSN0OgIO2hUsIvVlTKRI8
 BY6qecA4zq0/A231xmSyPwslEsuCFPIe1F638/D/RVm1atRBUEIA4Dk5dfrTyubSUv
 vE8NRWvIf+amOHalEwb9GTsHtv5hWZlbD91IAxBE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3RRu2YC6A5Qi for <linux-aspeed@lists.ozlabs.org>;
 Wed,  1 May 2019 17:49:47 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id F3635DE3E96
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2019 17:49:46 -0500 (CDT)
Date: Wed, 1 May 2019 17:49:46 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linux-aspeed@lists.ozlabs.org
Message-ID: <1890791123.3393899.1556750986902.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / PWM and DVO
 outputs on AST2500 devices
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF65 (Linux)/8.5.0_GA_3042)
Thread-Index: AzBW+2nC3PNDvhaq+SAX4dW2DMiQHQ==
Thread-Topic: aspeed/pinctrl: Fix simultaneous RS-232 / PWM and DVO outputs on
 AST2500 devices
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

There appears to be a small error in the pinmux table on pages 130 and
131 of the AST2500 datasheet v1.6.  Specifically, the COND2 requirement
used to mux the surrounding pins to DVI was inadvertently replicated to
pins V1, W1, V2, and W2 in the table, which do not incorporate DVI
functionality.

As a result of this error, both serial TX lines and the PWM 0/1 outputs
were overriding the VPO pinmux settings when VPO was enabled in the
pinmux hogs.

This patch has been verified to function on Blackbird hardware.  Both
serial TXD pins and PWM0/PWM1 were functionally tested with SCU94[1:0]
set to 0x1.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 187abd7693cf..6f357a11e89a 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -696,14 +696,14 @@ FUNC_GROUP_DECL(NRTS1, P3);
 #define V1 94
 #define V1_DESC		SIG_DESC_SET(SCU84, 22)
 SIG_EXPR_LIST_DECL_SINGLE(DASHV1, DASHV1, VPIRSVD_DESC, V1_DESC);
-SIG_EXPR_LIST_DECL_SINGLE(TXD1, TXD1, V1_DESC, COND2);
+SIG_EXPR_LIST_DECL_SINGLE(TXD1, TXD1, V1_DESC);
 MS_PIN_DECL(V1, GPIOL6, DASHV1, TXD1);
 FUNC_GROUP_DECL(TXD1, V1);
 
 #define W1 95
 #define W1_DESC		SIG_DESC_SET(SCU84, 23)
 SIG_EXPR_LIST_DECL_SINGLE(DASHW1, DASHW1, VPIRSVD_DESC, W1_DESC);
-SIG_EXPR_LIST_DECL_SINGLE(RXD1, RXD1, W1_DESC, COND2);
+SIG_EXPR_LIST_DECL_SINGLE(RXD1, RXD1, W1_DESC);
 MS_PIN_DECL(W1, GPIOL7, DASHW1, RXD1);
 FUNC_GROUP_DECL(RXD1, W1);
 
@@ -766,14 +766,14 @@ FUNC_GROUP_DECL(RXD2, T5);
 #define V2 104
 #define V2_DESC         SIG_DESC_SET(SCU88, 0)
 SIG_EXPR_LIST_DECL_SINGLE(DASHN0, DASHN0, VPIRSVD_DESC, V2_DESC);
-SIG_EXPR_LIST_DECL_SINGLE(PWM0, PWM0, V2_DESC, COND2);
+SIG_EXPR_LIST_DECL_SINGLE(PWM0, PWM0, V2_DESC);
 MS_PIN_DECL(V2, GPION0, DASHN0, PWM0);
 FUNC_GROUP_DECL(PWM0, V2);
 
 #define W2 105
 #define W2_DESC         SIG_DESC_SET(SCU88, 1)
 SIG_EXPR_LIST_DECL_SINGLE(DASHN1, DASHN1, VPIRSVD_DESC, W2_DESC);
-SIG_EXPR_LIST_DECL_SINGLE(PWM1, PWM1, W2_DESC, COND2);
+SIG_EXPR_LIST_DECL_SINGLE(PWM1, PWM1, W2_DESC);
 MS_PIN_DECL(W2, GPION1, DASHN1, PWM1);
 FUNC_GROUP_DECL(PWM1, W2);
 
-- 
2.11.0

