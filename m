Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 496804E729E
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 13:00:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ0yh0jvXz307B
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 23:00:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lu1qi+4K;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z8rYfQPk;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=hdegoede@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Lu1qi+4K; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z8rYfQPk; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPWff4JKvz3048
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 03:59:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648141175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bScuBlTCR/SuoeRC/MEmbsQaF2jR6pySvoofKTbZ9I=;
 b=Lu1qi+4KKViH4/F7PxBrZG7Af6QelHupPv+iNlkc0cvYpXxgV6cvkvjknkQet/frsLIkab
 VPc2jAYNHBDM4Rk7G1+dmqZ1A7W9cWMizmnGk6Hx5uvtuwtxwFp9MDkGZRdYpmQR37/eou
 L7YE1kssJ+NmB+g9ZhGDDQEgJyAcO48=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648141176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bScuBlTCR/SuoeRC/MEmbsQaF2jR6pySvoofKTbZ9I=;
 b=Z8rYfQPkxITCpWQhzmGulUBRQ1GJhm9u+qpv+G9vBK0Xkgll1gVrsfov5T+QIeZ7+N59Sk
 HfQeOkXbOqQ2Wj8eoL4S/EAl11cD3jBT75+ziJLGnPV6NjCOir9LlZhjbjrd98GPHl9c9h
 EpYtlEikHizxj2+k6GuVAAv5eyvjMdc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-QR4RPUjdPEunvOSwyOCvyQ-1; Thu, 24 Mar 2022 12:59:30 -0400
X-MC-Unique: QR4RPUjdPEunvOSwyOCvyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDCE61C0E343;
 Thu, 24 Mar 2022 16:59:29 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55416C15D7D;
 Thu, 24 Mar 2022 16:59:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Huang Jianan <huangjianan@oppo.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/3] Documentation/ABI: sysfs-class-thermal: Fix Sphinx warning
Date: Thu, 24 Mar 2022 17:59:17 +0100
Message-Id: <20220324165918.22005-3-hdegoede@redhat.com>
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

Documentation/ABI/testing/sysfs-class-thermal:201:
  WARNING: Bullet list ends without a blank line; unexpected unindent.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/ABI/testing/sysfs-class-thermal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-thermal b/Documentation/ABI/testing/sysfs-class-thermal
index 2c52bb1f864c..8eee37982b2a 100644
--- a/Documentation/ABI/testing/sysfs-class-thermal
+++ b/Documentation/ABI/testing/sysfs-class-thermal
@@ -203,7 +203,7 @@ Description:
 
 		- for generic ACPI: should be "Fan", "Processor" or "LCD"
 		- for memory controller device on intel_menlow platform:
-		should be "Memory controller".
+		  should be "Memory controller".
 
 		RO, Required
 
-- 
2.35.1

