Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4559371990
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 May 2021 18:36:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYpWV6mr1z2yxW
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 May 2021 02:36:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=G2mEL9a+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=G2mEL9a+; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYpWL6h5Bz2xfn
 for <linux-aspeed@lists.ozlabs.org>; Tue,  4 May 2021 02:35:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=N8b6AHrFH7G1Q2NJd1TCUNskzAIwu+2bvkyfZZCq+Gs=; b=G2mEL9a+ZTIvLPPa3TW+AU9HOJ
 J/FEk1Sj5zSFQ+Dsf8tYFEEd13wcGpYUQiG6FRjP4Ngr/KCwoI+AvBhzDul8lUMRn3JhO39jK5rtq
 hxgq70ALF9YdND6HQro2T6+2ILrsDBhrR/R5UUq7FxU+TyRi7Sf4PKeQ0PpX9nuDM59KP3+zz039h
 lxuRCwzmNf2OkFypm/I0i82HJ84uVCsUSUzXh1+14J4Wk7HBLf/lupgjJ0zB9OvRNS6SBV4EEiH/i
 V7bNhv2FNV7X9+vM4C1qaLF7//h4dlNlrHsjJidjPnxEiAZ5H29tMJ4Hf2pp7OY+31u1F6EJhiCuO
 HTIQ445w==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ldbWR-00FJuO-1p; Mon, 03 May 2021 16:34:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] EDAC: aspeed: print resource_size_t using %pa
Date: Mon,  3 May 2021 09:34:09 -0700
Message-Id: <20210503163409.31944-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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
Cc: kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Stefan Schaeckeler <sschaeck@cisco.com>,
 Borislav Petkov <bp@suse.de>, linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fix build warnings for using "%x" to print resource_size_t in 2 places.
resource_size_t can be either of u32 or u64. We have a special format
"%pa" for printing a resource_size_t, which is the same as a phys_addr_t.
See Documentation/core-api/printk-formats.rst.

  CC      drivers/edac/aspeed_edac.o
../drivers/edac/aspeed_edac.c: In function 'init_csrows':
../drivers/edac/aspeed_edac.c:257:21: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
  257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
  257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
  257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
../drivers/edac/aspeed_edac.c:257:21: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
  257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
  257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
  257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",

Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Troy Lee <troy_lee@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>
Cc: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>
Cc: Borislav Petkov <bp@suse.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: linux-aspeed@lists.ozlabs.org
---
Found in linux-next but applies to mainline.

 drivers/edac/aspeed_edac.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- linux-next-20210503.orig/drivers/edac/aspeed_edac.c
+++ linux-next-20210503/drivers/edac/aspeed_edac.c
@@ -234,6 +234,7 @@ static int init_csrows(struct mem_ctl_in
 	u32 nr_pages, dram_type;
 	struct dimm_info *dimm;
 	struct device_node *np;
+	resource_size_t rsize;
 	struct resource r;
 	u32 reg04;
 	int rc;
@@ -254,11 +255,12 @@ static int init_csrows(struct mem_ctl_in
 		return rc;
 	}
 
-	dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
-		r.start, resource_size(&r), PAGE_SHIFT);
+	rsize = resource_size(&r);
+	dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%pa, resource_size=0x%pa, PAGE_SHIFT macro=0x%x\n",
+		&r.start, &rsize, PAGE_SHIFT);
 
 	csrow->first_page = r.start >> PAGE_SHIFT;
-	nr_pages = resource_size(&r) >> PAGE_SHIFT;
+	nr_pages = rsize >> PAGE_SHIFT;
 	csrow->last_page = csrow->first_page + nr_pages - 1;
 
 	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
