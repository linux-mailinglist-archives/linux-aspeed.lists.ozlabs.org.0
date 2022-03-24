Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D054E729D
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 13:00:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ0yd3Nvxz30BK
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 23:00:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWy0VyP1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWy0VyP1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=hdegoede@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PWy0VyP1; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWy0VyP1; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPWfd4BMxz3048
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 03:59:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648141174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HoU1CnOuyhMAlEaaC12/xCNXrJPRzI+Ntu0MYgwKlIE=;
 b=PWy0VyP18yEmRlk5/FaDIELkh0OoeheV68TMAQEHsQH0NL4O9RXjw13pyb4d/4iGN62MSR
 CNxal7qJGHj9d8eRImPIMv7xd9pIPO6pN1zdk/UBRn4bPyYdqJCBUgc/r+dc0GAXmdQGe7
 HSB0bN+ZbfMsf0H7nYEJBVLk5DxIgeU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648141174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HoU1CnOuyhMAlEaaC12/xCNXrJPRzI+Ntu0MYgwKlIE=;
 b=PWy0VyP18yEmRlk5/FaDIELkh0OoeheV68TMAQEHsQH0NL4O9RXjw13pyb4d/4iGN62MSR
 CNxal7qJGHj9d8eRImPIMv7xd9pIPO6pN1zdk/UBRn4bPyYdqJCBUgc/r+dc0GAXmdQGe7
 HSB0bN+ZbfMsf0H7nYEJBVLk5DxIgeU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-0PnzShTtP7eZ3Lw5u9qB_Q-1; Thu, 24 Mar 2022 12:59:27 -0400
X-MC-Unique: 0PnzShTtP7eZ3Lw5u9qB_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2CE51044566;
 Thu, 24 Mar 2022 16:59:26 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB747C26EA0;
 Thu, 24 Mar 2022 16:59:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Huang Jianan <huangjianan@oppo.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/3] Documentation/ABI: sysfs-driver-aspeed-uart-routing: Fix
 sphinx warning
Date: Thu, 24 Mar 2022 17:59:16 +0100
Message-Id: <20220324165918.22005-2-hdegoede@redhat.com>
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

Fix the following warning from "make htmldocs":

Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing:2:
  WARNING: Inline emphasis start-string without end-string.

This is caused by the used of '*' in the example cat command,
mark the command as code to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
index b363827da437..1e25cd2cacc1 100644
--- a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
+++ b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
@@ -8,9 +8,10 @@ Description:	Selects the RX source of the UARTx device.
 		selected option marked by brackets "[]". The list of available options
 		depends on the selected file.
 
-		e.g.
-		cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
-		[io1] io2 io3 io4 uart2 uart3 uart4 io6
+		e.g.::
+
+			# cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
+			[io1] io2 io3 io4 uart2 uart3 uart4 io6
 
 		In this case, UART1 gets its input from IO1 (physical serial port 1).
 
-- 
2.35.1

