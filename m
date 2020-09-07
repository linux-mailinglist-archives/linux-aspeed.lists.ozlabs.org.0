Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FE626070D
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 00:53:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blk8b2MbBzDqQT
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 08:53:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Blk8L1w8MzDqNH
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Sep 2020 08:53:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=X//KQJI+2rxTvx9HYo5PyD3EKrrYMxBIJ9G0Zyy/Erk=; b=VMyPYkloriTZMlh/n+Oypp2fPa
 SdjPqr0odppjLDJCDTXXWbBIuo2J9DH4nYVtR3455fZk+1dlRlwnl+YM0JuOFTmmW80Pcl0rcfZdG
 tP2YhRN5g+/1LOVnf942aZWjWA1vKNMYlrZJ7+SCGmy11fZgGfTbu0f7gNZHPEL2hwpdUtjkRCpvz
 CViWoxJrNJLkgGk+OyusMFK+/VtpT9jAkQSliran4EGSn/WlVqvhMNSr3BRr8Wfz2A8KPrloEdPYf
 IHqH2D8/Ux3tZA0jPhkheWTW1+EoOsbK5xGNpy6Km7f5Nge19f2n4jOCMbKTVeZe35n+863DYcaTS
 Law6ANbw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFQ0E-0003Ku-6R; Mon, 07 Sep 2020 22:52:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/aspeed: fix Kconfig warning & subsequent build errors
Date: Mon,  7 Sep 2020 15:52:38 -0700
Message-Id: <20200907225238.4790-1-rdunlap@infradead.org>
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
Cc: Michal Simek <monstr@monstr.eu>, kernel test robot <lkp@intel.com>,
 linux-aspeed@lists.ozlabs.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Randy Dunlap <rdunlap@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

kernel test robot reported build errors (undefined references)
that didn't make much sense. After reproducing them, there is also
a Kconfig warning that is the root cause of the build errors, so
fix that Kconfig problem.

Fixes this Kconfig warning:
WARNING: unmet direct dependencies detected for CMA
  Depends on [n]: MMU [=n]
  Selected by [m]:
  - DRM_ASPEED_GFX [=m] && HAS_IOMEM [=y] && DRM [=m] && OF [=y] && (COMPILE_TEST [=y] || ARCH_ASPEED) && HAVE_DMA_CONTIGUOUS [=y]

and these dependent build errors:
(.text+0x10c8c): undefined reference to `start_isolate_page_range'
microblaze-linux-ld: (.text+0x10f14): undefined reference to `test_pages_isolated'
microblaze-linux-ld: (.text+0x10fd0): undefined reference to `undo_isolate_page_range'

Fixes: 76356a966e33 ("drm: aspeed: Clean up Kconfig options")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: linux-mm@kvack.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
Feel free to fix the Kconfig warning some other way...

 drivers/gpu/drm/aspeed/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- lnx-59-rc3.orig/drivers/gpu/drm/aspeed/Kconfig
+++ lnx-59-rc3/drivers/gpu/drm/aspeed/Kconfig
@@ -3,6 +3,7 @@ config DRM_ASPEED_GFX
 	tristate "ASPEED BMC Display Controller"
 	depends on DRM && OF
 	depends on (COMPILE_TEST || ARCH_ASPEED)
+	depends on MMU
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DMA_CMA if HAVE_DMA_CONTIGUOUS
