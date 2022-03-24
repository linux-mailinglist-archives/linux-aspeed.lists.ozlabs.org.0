Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 680684E729F
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 13:00:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ0yl2Zvtz306D
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 23:00:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZynVHcgR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZynVHcgR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=hdegoede@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZynVHcgR; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZynVHcgR; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPWfj4H6Cz305j
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 03:59:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648141179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6IfREbj9fKQtRnAg2pDT/5pKTpdLNrvvzJnz4m1uJk0=;
 b=ZynVHcgRCqrHRvsiiY7wc+yCxVmOm/xS0RD04HRyXur6+INix22wnUtm/Mj+6nKlNZoDX0
 fr65xAFXpbAAJrRAgp0DssebxQEPy7MWK6sahrx0ugtjWW3G5bLz+Y1Z1gE73z7VYGQ8s6
 SqDK4L6It8r2B+xBGtbXNtbIIRz+qOM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648141179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6IfREbj9fKQtRnAg2pDT/5pKTpdLNrvvzJnz4m1uJk0=;
 b=ZynVHcgRCqrHRvsiiY7wc+yCxVmOm/xS0RD04HRyXur6+INix22wnUtm/Mj+6nKlNZoDX0
 fr65xAFXpbAAJrRAgp0DssebxQEPy7MWK6sahrx0ugtjWW3G5bLz+Y1Z1gE73z7VYGQ8s6
 SqDK4L6It8r2B+xBGtbXNtbIIRz+qOM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-wCqIudkiPKuCtPvzD40K3w-1; Thu, 24 Mar 2022 12:59:33 -0400
X-MC-Unique: wCqIudkiPKuCtPvzD40K3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE0E9801585;
 Thu, 24 Mar 2022 16:59:32 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2759DC26EA0;
 Thu, 24 Mar 2022 16:59:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Huang Jianan <huangjianan@oppo.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/3] Documentation/ABI: sysfs-fs-erofs: Fix Sphinx errors
Date: Thu, 24 Mar 2022 17:59:18 +0100
Message-Id: <20220324165918.22005-4-hdegoede@redhat.com>
In-Reply-To: <20220324165918.22005-1-hdegoede@redhat.com>
References: <20220324165918.22005-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Fri, 25 Mar 2022 23:00:04 +1100
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-aspeed@lists.ozlabs.org,
 linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Gao Xiang <hsiangkao@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fix the following warnings from "make htmldocs":

Documentation/ABI/testing/sysfs-fs-erofs:10:
  ERROR: Unexpected indentation.
  WARNING: Block quote ends without a blank line; unexpected unindent.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/ABI/testing/sysfs-fs-erofs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-erofs b/Documentation/ABI/testing/sysfs-fs-erofs
index 05482374a741..bb4681a01811 100644
--- a/Documentation/ABI/testing/sysfs-fs-erofs
+++ b/Documentation/ABI/testing/sysfs-fs-erofs
@@ -9,8 +9,9 @@ Description:	Shows all enabled kernel features.
 What:		/sys/fs/erofs/<disk>/sync_decompress
 Date:		November 2021
 Contact:	"Huang Jianan" <huangjianan@oppo.com>
-Description:	Control strategy of sync decompression
+Description:	Control strategy of sync decompression:
+
 		- 0 (default, auto): enable for readpage, and enable for
-				     readahead on atomic contexts only,
+		  readahead on atomic contexts only.
 		- 1 (force on): enable for readpage and readahead.
 		- 2 (force off): disable for all situations.
-- 
2.35.1

