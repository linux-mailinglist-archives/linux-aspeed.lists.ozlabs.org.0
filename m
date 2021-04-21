Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C522C366D49
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Apr 2021 15:55:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQMWP5P3xz2yxr
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Apr 2021 23:55:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i0gTfVfz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i0gTfVfz; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQMWL6LzHz2xZS
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Apr 2021 23:55:10 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAC6B611F2;
 Wed, 21 Apr 2021 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619013307;
 bh=JD5ziEk/FB8CNzMad7zbcOvmZivcvUwNl7nwAGloB5w=;
 h=From:To:Cc:Subject:Date:From;
 b=i0gTfVfze0/PUJiMP682KpT9c250YJgN8nYi7fAF1ZSJklOTRE7NrVvG0j+02PR45
 Ls4m1q+1KehLZmP8q3ld7gfP5y5ufPdyN8SFN0xnzE22DmWq4tAfQEbrSKcfQeH4U2
 zkaX3jmIYXWFa2dQ1RJsAZWtXW1pKR1xeZ/E4tmsKb/AADmC5HcISI008N6qAZb3hp
 2UrWjqEd0UOtC9nVlQesswvXD9QYKaUYqvPXazujPkCfwoY2LwvAQ+dFR+KNXMakFD
 MK0Ms+CkWg9nJuuzex4fZo4CxhWInZ1CFfIWxmUYk1GrFNmtLg13+tdKO4MFpJni6A
 ZJX8EbmUw/AdA==
From: Arnd Bergmann <arnd@kernel.org>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>
Subject: [PATCH] EDAC/aspeed: use proper format string for printing resource
Date: Wed, 21 Apr 2021 15:54:53 +0200
Message-Id: <20210421135500.3518661-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Robert Richter <rric@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Liu Shixin <liushixin2@huawei.com>,
 James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On ARMv7, resource_size_t can be 64-bit, which breaks printing
it as %x:

drivers/edac/aspeed_edac.c: In function 'init_csrows':
drivers/edac/aspeed_edac.c:257:28: error: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Werror=format=]
  257 |         dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",

Use the special %pR format string to pretty-print the entire
resource instead.

Fixes: edfc2d73ca45 ("EDAC/aspeed: Add support for AST2400 and AST2600")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/edac/aspeed_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index a46da56d6d54..6bd5f8815919 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -254,8 +254,8 @@ static int init_csrows(struct mem_ctl_info *mci)
 		return rc;
 	}
 
-	dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
-		r.start, resource_size(&r), PAGE_SHIFT);
+	dev_dbg(mci->pdev, "dt: /memory node resources: first page %pR, PAGE_SHIFT macro=0x%x\n",
+		&r, PAGE_SHIFT);
 
 	csrow->first_page = r.start >> PAGE_SHIFT;
 	nr_pages = resource_size(&r) >> PAGE_SHIFT;
-- 
2.29.2

