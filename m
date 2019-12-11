Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B311BCFA
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 20:28:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y6RX1NwyzDqnT
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 06:28:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com;
 envelope-from=3vkpxxq4kajc2i5e41e89779ej7ff7c5.3fd@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="R4J+hp7a"; 
 dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y6RN01cBzDqg7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 06:28:25 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id r2so2718503pfl.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 11:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Z9cyJ6q/dRKwszgWPK/I6HD4udk/HngreENNBBFw7AE=;
 b=R4J+hp7ameLmcKBvWd1R3GHgVQMiqDLeCk+xK86P/IRMuh6UmJa9Faa5uqjS4kWyFg
 lL/VL+0yiQSVCjjou1PYLwUk5n8YWw+5HFdP2a92aB7l5OvSR7njVCuEuEU7ILdNksTE
 2IpI6glhHVDy6eNg96ttbF925uLPxi+VoHZCb7VWblcUGDkMrvhzGjACHIWT/UqDBsaz
 ONTjf5w9eu8EeVbm9tB0FOcag12BKE6rhip+RYd5P8VyZ62mxl0MZ8QED5kQRVYL1c0H
 UQ1HaAdchOoT2M+AZajZrwAWD8PvQ9W1PwBcEmzwoAJM3GxLhGO1mshgQ2QK1+Gs3kcV
 wa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Z9cyJ6q/dRKwszgWPK/I6HD4udk/HngreENNBBFw7AE=;
 b=NiYmNRtndPS9xsI5NOrANzHlnrsj1T3SQP9yTqdjK1VXhoKF885UzFz+j3ipzCHjr4
 xv7gYQ0NWLRq+4pUFJehmsZGDAVxUw23SK+OU4qAUFB6au9Q8n8nic/+gVlNKSw+Ovav
 9UHlghlWXVli8Vsj6D7F/aJ/D6syCXt3P9J3/CLq0+49g0t27Od3GH8xhvCA2xoOHUzY
 BxavVTNp1NvKVA0ry7cLpjPBKoep2Pn5rUFGN3p2hbEiafY0VOvTfPbkPa/3IueKfQMC
 cEiRTjM0oGza247UpS+bqMMABimXijmcShwNCvIOzdw3TnOQwBoJxARbFnq3CJzmFyYf
 R+OQ==
X-Gm-Message-State: APjAAAVDEjRB8OLS3PsY/7MFXq4LWDb8X5kc1U1CLdcSPqxcrQK3D4kb
 3kvDsAPz6ULIUFK8s3FQrcihfSChLFgg7n1EmprTuA==
X-Google-Smtp-Source: APXvYqyYij4yV+DXbejSHZeng6BXYHuLudblK+kNmIhwXq4dmlZ+ZGkXmoMKknhbAuxQ+DE/c95Qal0IVJbWFYYgdCBmMg==
X-Received: by 2002:a63:28a:: with SMTP id 132mr5883273pgc.165.1576092502945; 
 Wed, 11 Dec 2019 11:28:22 -0800 (PST)
Date: Wed, 11 Dec 2019 11:27:42 -0800
In-Reply-To: <20191211192742.95699-1-brendanhiggins@google.com>
Message-Id: <20191211192742.95699-8-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH v1 7/7] fsi: aspeed: add unspecified HAS_IOMEM dependency
From: Brendan Higgins <brendanhiggins@google.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jeremy Kerr <jk@ozlabs.org>, 
 Alistar Popple <alistair@popple.id.au>, Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed@lists.ozlabs.org, linux-um@lists.infradead.org,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 davidgow@google.com, linux-arm-kernel@lists.infradead.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Currently CONFIG_FSI_MASTER_ASPEED=y implicitly depends on
CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
the following build error:

ld: drivers/fsi/fsi-master-aspeed.o: in function `fsi_master_aspeed_probe':
drivers/fsi/fsi-master-aspeed.c:436: undefined reference to `devm_ioremap_resource'

Fix the build error by adding the unspecified dependency.

Reported-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/fsi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 92ce6d85802cc..4cc0e630ab79b 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -55,6 +55,7 @@ config FSI_MASTER_AST_CF
 
 config FSI_MASTER_ASPEED
 	tristate "FSI ASPEED master"
+	depends on HAS_IOMEM
 	help
 	 This option enables a FSI master that is present behind an OPB bridge
 	 in the AST2600.
-- 
2.24.0.525.g8f36a354ae-goog

