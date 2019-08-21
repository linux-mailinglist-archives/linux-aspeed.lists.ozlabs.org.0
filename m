Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D629971B9
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 07:56:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CxjV4bN7zDqyh
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 15:55:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VrD8jISq"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CxjQ6wsmzDqGC
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 15:55:54 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id w16so684301pfn.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2019 22:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XKfnFWl/Re53uZxX946ZGFyGhfMIBKgXF4IGRnFtD8c=;
 b=VrD8jISqhaWCNVnCq3ybrxNxNmQ4ACqNpbJ7JKRWQ5gSRv8WI9YJhFHYDRTQVGdtdI
 cv+BJ2ZIgt/D5FsRFukc+qdsO1Vto4WV2ambk7wp1PRfyjajpXUZviSbgiF0a+uoLnd/
 depfyMVG3kknaO0GnhHt5CHo3XGId+EXFkxV75Jd7Beab0Xq23NFpuM3iL92bCl8jucM
 ifXpWfmztoLdojnLH3BpmGMByWqxaQdqYrD8xvQqZAFDfeWOui2MYLH+qLlrTrH2fmvF
 pTZGrVdLx5/9ztinKlDsXTBFucKunvEGBdZeIdhfBKcn3XxKidmkom5w1Ijt9IBiN8kO
 iC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XKfnFWl/Re53uZxX946ZGFyGhfMIBKgXF4IGRnFtD8c=;
 b=HtqT8J/4Se/xlRvw/Uy6iZLCMxm9wAaUJpox4IbN/hvM4ZouStE0qqyesE5/LDbdGD
 w7ZPuN1j9JO6bj2Ez3ONwFSP5CjrndjTnR+fOPMYt0AZPjjLE5RCHSJeQyVqxnDTeZco
 8F+6LWXKABA6IgKpcljyoidhztDq0eqpPzFdgZBZAcmQA9cw8EwSikbFuqfK7OgAoaCl
 ryIE6ZR/jrwp2+lSdLgjc4KA+loIJD1s9JG0h28Q58ETnKlkpmQpPQKLWzPRXsaykUnx
 PwbsGuiJG5k9wSlsAwqyXLVeHkewllF319bZ6NUX9la4kkT9fYk+QfW0lllWRA0nceb2
 T3RQ==
X-Gm-Message-State: APjAAAVyWup+QEhBw7I+zI/d3sUvd+NqFHeSS2g9wAySa82S17Qp4fb5
 mC0rb+LNKYL7jdyCB8uXEoo=
X-Google-Smtp-Source: APXvYqzZ9NdwpWhXVb+ZaxgqkGTd48D3aKr0kyEBbd+2/+GmPbOIT5wlXAOKXwlmevPl59H0e60MSQ==
X-Received: by 2002:a62:388f:: with SMTP id
 f137mr34456016pfa.131.1566366952321; 
 Tue, 20 Aug 2019 22:55:52 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m9sm26568254pfh.84.2019.08.20.22.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 22:55:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH 0/7] ARM: Add ASPEED AST2600 support
Date: Wed, 21 Aug 2019 15:25:23 +0930
Message-Id: <20190821055530.8720-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This adds the architecture, device tree and configuration required to
support a new ASPEED BMC chip.

I'd appreciate a review from those on cc before I break the patches into
their respective trees and send them as part of my ASPEED pull request
for 5.4. Thanks!


Joel Stanley (7):
  dt-bindings: arm: cpus: Add ASPEED SMP
  ARM: aspeed: Select timer in each SoC
  ARM: aspeed: Add ASPEED AST2600 architecture
  ARM: aspeed: Enable SMP boot
  ARM: dts: aspeed: Add AST2600 and EVB
  ARM: configs: multi_v7: Add ASPEED G6
  ARM: configs: aspeed_g5: Enable AST2600

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 arch/arm/Makefile                             |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts      |  44 +++
 arch/arm/boot/dts/aspeed-g6.dtsi              | 266 ++++++++++++++++++
 arch/arm/configs/aspeed_g5_defconfig          |  17 +-
 arch/arm/configs/multi_v7_defconfig           |  19 ++
 arch/arm/mach-aspeed/Kconfig                  |  17 +-
 arch/arm/mach-aspeed/Makefile                 |   5 +
 arch/arm/mach-aspeed/platsmp.c                |  61 ++++
 10 files changed, 427 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-ast2600-evb.dts
 create mode 100644 arch/arm/boot/dts/aspeed-g6.dtsi
 create mode 100644 arch/arm/mach-aspeed/Makefile
 create mode 100644 arch/arm/mach-aspeed/platsmp.c

-- 
2.23.0.rc1

