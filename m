Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B67E6636BF
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Jan 2023 02:39:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrYPz2JbCz3cKB
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Jan 2023 12:39:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s0zcsXJ1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s0zcsXJ1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrYPt5C4yz2xBV
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Jan 2023 12:39:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA896614B1;
	Tue, 10 Jan 2023 01:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EACC433EF;
	Tue, 10 Jan 2023 01:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673314750;
	bh=2kOxmVscJ0t8ceI4B5aGjHT1LyF2wAdxmeKbbucTgVM=;
	h=Date:From:To:Cc:Subject:From;
	b=s0zcsXJ1bYO8TaF0VS1YgBT615bIXmHXZD4oEytBCR1eBws6SdPfRKfb8iCQy2bwi
	 owhRi/eU+e6OrfUiuL2KvlT9gPe2e84ZwDdTAgXGaJRJqaZ+3zYlII7zET63AuuacT
	 OOLOQ5vkrHKQ+qCH5knAXbqMsy8ANjQm+QP7HRZ8bGYHHAu0TPQk7gdLxl8bsPX+d9
	 7Kl6R4WnMAEbXJE6xSR3P2eLOirCsBz8gUBHRq+0oN+5DNjocpnMFuTpR/zSs8yyuB
	 7hTz7g6pKLdX3dp9DEPrlcEIS7JV4OTc869bVmm5Jluoh6O0akYlKjOhE+gq9/w2Cn
	 LDLPR+Yi6q1kg==
Date: Mon, 9 Jan 2023 19:39:17 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Neal Liu <neal_liu@aspeedtech.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH][next] crypto: aspeed - Replace zero-length array with
 flexible-array member
Message-ID: <Y7zBxbEAvcEEJRie@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-aspeed@lists.ozlabs.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Zero-length arrays are deprecated[1] and we are moving towards
adopting C99 flexible-array members instead. So, replace zero-length
array declaration in struct aspeed_sham_ctx with flex-array
member.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [2].

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
Link: https://github.com/KSPP/linux/issues/78
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/crypto/aspeed/aspeed-hace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/aspeed/aspeed-hace.h b/drivers/crypto/aspeed/aspeed-hace.h
index f2cde23b56ae..05d0a15d546d 100644
--- a/drivers/crypto/aspeed/aspeed-hace.h
+++ b/drivers/crypto/aspeed/aspeed-hace.h
@@ -183,7 +183,7 @@ struct aspeed_sham_ctx {
 	struct aspeed_hace_dev		*hace_dev;
 	unsigned long			flags;	/* hmac flag */
 
-	struct aspeed_sha_hmac_ctx	base[0];
+	struct aspeed_sha_hmac_ctx	base[];
 };
 
 struct aspeed_sham_reqctx {
-- 
2.34.1

