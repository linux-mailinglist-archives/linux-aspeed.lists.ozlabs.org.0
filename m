Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C59055F
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2019 18:04:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4697Rl4MYbzDrgB
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Aug 2019 02:04:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="laK7fSDD"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4697RN4ssRzDrVV
 for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Aug 2019 02:03:59 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id m9so2610791pls.8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2019 09:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GwGe81D2anB9mnM0YX892gY8U5CQnq5hIJv2VCFOwV4=;
 b=laK7fSDD4qkzN+zl86yItrHAB8NU8mXzryoe9aRGvoMMZlT0TxpGj1/Ha4P4gflWHA
 T99Qh9Pi4zx7Z0VZurGNIEsu74Zsjp9V9p/Fi9rz/9LDM9DoCNQtoWhDgUBnmAsYErIk
 e8pJeBfK8RmXHBAaDVFOxyPaOCVNfr1gPHaFwrnBScbTG3owz0zDyzXls3ghLKtqfiEE
 c5S9WehnKAuWOJ6MM90VVf63G7hpd3qP8MfGbYmHoNcO+ImWDT7IiNFF/W+PUctGEbir
 oXmAHYOyWkbDr8k2Uf7CfsCn7D6p/21Yq4QVbDbrBd+ZC4Okr5CbBa0aMCHd0xR8VEze
 WoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GwGe81D2anB9mnM0YX892gY8U5CQnq5hIJv2VCFOwV4=;
 b=gXQUhrYK3F9iBulQk9DcmtgmeBVYz9HIsqC548c8Nj9yjzLmabfkzV014atp7J9krw
 1aGtQMrieKf5MCioFCWaelufMo4vb5N+Co7wHTAaDHsN/XEi7Xo6L5dFu3h//Zo/8fB+
 0ayR1b69Wr9VNgRRmNc06tj7+JZka2vZoL180EtgRtV+wQAJSTngV+HMenxClRkzdNOB
 6sJicuoiPr2HkrS3atgYzazBjZT9qrWAQOw2um26Dymkl8Xu4hOxE34wY21nsAFZOYDw
 aosu3olT46z/X+CrtX+y4fbFQ3kaY4vuc3wChwPnS1jQ6JzUfliE9HrzaeX++CDP58sT
 JBDQ==
X-Gm-Message-State: APjAAAVj9dXNaBhaidkevkTsJ/HddCv/mOgoW5IoQv8J5ZxxBIxMRc7h
 13oSOST70YfbQxZkPc31IDE=
X-Google-Smtp-Source: APXvYqzpm5dy7HXa9JCQorRwUEZmNlywT5j/avC3GHFnPAF1jfRW7adr1QAbkIJ+PGD5tvnPcTjpRQ==
X-Received: by 2002:a17:902:2f43:: with SMTP id
 s61mr10288124plb.238.1565971437722; 
 Fri, 16 Aug 2019 09:03:57 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id m20sm7578607pff.79.2019.08.16.09.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 09:03:57 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/2] watchdog: aspeed: Add support for ast2600
Date: Sat, 17 Aug 2019 01:33:45 +0930
Message-Id: <20190816160347.23393-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

Here's a small patch series to enable the ast2600 watchdog.

Joel Stanley (1):
  dt-bindings: watchdog: Add ast2600 compatible

Ryan Chen (1):
  watchdog: aspeed: Add support for AST2600

 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
 drivers/watchdog/aspeed_wdt.c                             | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.23.0.rc1

