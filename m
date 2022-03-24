Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B88464E729C
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 13:00:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ0yZ4sNcz30Dv
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 23:00:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XZ7OPtxv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XZ7OPtxv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=hdegoede@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XZ7OPtxv; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=XZ7OPtxv; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPWfY6tLVz3048
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 03:59:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648141167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=b/sS1I4x2XsmlSGjKr1ZTMhx5qQzprN548q1C8bCjuA=;
 b=XZ7OPtxvW5kkPqJ/J4zGNTCvY1ggLTMzqv64m+FjUfBvULQ8dURDTDNqZasnONSaD/aiDp
 aQIUhA3oZ57fS6pqzvmMC8+0CsiPzzc0KepUiOW96+kgwUcVALt6GT5kbeqWyiahuUSjUx
 HvwHg5YTshmPcF+yB81EVoBILzQjsbk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648141167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=b/sS1I4x2XsmlSGjKr1ZTMhx5qQzprN548q1C8bCjuA=;
 b=XZ7OPtxvW5kkPqJ/J4zGNTCvY1ggLTMzqv64m+FjUfBvULQ8dURDTDNqZasnONSaD/aiDp
 aQIUhA3oZ57fS6pqzvmMC8+0CsiPzzc0KepUiOW96+kgwUcVALt6GT5kbeqWyiahuUSjUx
 HvwHg5YTshmPcF+yB81EVoBILzQjsbk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-08azyXoUOjCal3lrW4fzKA-1; Thu, 24 Mar 2022 12:59:24 -0400
X-MC-Unique: 08azyXoUOjCal3lrW4fzKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 792FD1C0E341;
 Thu, 24 Mar 2022 16:59:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F160C15D7D;
 Thu, 24 Mar 2022 16:59:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Huang Jianan <huangjianan@oppo.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/3] Documentation/ABI/testing: Sphinx warning fixes
Date: Thu, 24 Mar 2022 17:59:15 +0100
Message-Id: <20220324165918.22005-1-hdegoede@redhat.com>
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

Hi All,

After Stephen reported some Sphinx warnings for the platform-drivers-x86,
I had to first figure out how to reproduce these. It turns out that to
regenerate the htmldocs for Documentation/ABI/testing one has to run:

touch Documentation/admin-guide/abi-testing.rst && make htmldocs

This turned up not only warnings from platform/x86 driver ABI but also
for some others. While at it I've written fixes for those too.

I'm not sure how these should be merged, I guess that the relevant
subsys maintainers will pick these up?

Regards,

Hans
   

Hans de Goede (3):
  Documentation/ABI: sysfs-driver-aspeed-uart-routing: Fix sphinx
    warning
  Documentation/ABI: sysfs-class-thermal: Fix Sphinx warning
  Documentation/ABI: sysfs-fs-erofs: Fix Sphinx errors

 Documentation/ABI/testing/sysfs-class-thermal              | 2 +-
 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing | 7 ++++---
 Documentation/ABI/testing/sysfs-fs-erofs                   | 5 +++--
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.35.1

