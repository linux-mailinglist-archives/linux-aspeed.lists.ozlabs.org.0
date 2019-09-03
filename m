Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6A1A6AB4
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 16:03:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N7wG1qhTzDqjd
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 00:03:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.196; helo=mail-qt1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N7w80hmYzDqC3
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2019 00:03:35 +1000 (AEST)
Received: by mail-qt1-f196.google.com with SMTP id r15so14374188qtn.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2019 07:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RVjcyrTn4gmDwaWy/oDAvPimC2fsZRy5y2KkmSMwcNE=;
 b=aBeC4V0bXDpMbsx2n/oAJyKlrJgdF04pUOu4GKtM+9cVcGxTcKcbLPS7evgd+oDV6M
 sYMsT4ij2UVXI3thiIMVw83dgQ51DAtWq7iI6N38vd3KtM49cbFN5q8/H/vr6jrEgPjR
 ju2SWMzGqAfgzFbrMJDIB4jc9L6vY5W9yqStYab0AAosItY/QUr+aKCiXFi0N2/r7w6q
 AN3bENPWgAwW7NUQNyGa8Mn7tSuTa4adDhy/nUwDIGLst8ynY7+q959u2ZftdGoCDs+R
 jisrf40GUBLYxX27+B4d5tNuYmlK/PKYmmJjP3gvVb+Y7o2y6Z/KhhOWfDnERwhq44Dp
 AYaA==
X-Gm-Message-State: APjAAAX9Xeubg+a4JDujz+Hcz+ZTmD1vGhUcnJ6PPA8URXvumxYV8H1y
 4Zgk9VXF1a54FZrgr7XHVzsm+w1G+50nUroBcIk=
X-Google-Smtp-Source: APXvYqw9BG/l25Dkw35xsVDHMole0pNrF60Y3lZr+y8NOpkdhMtbpNunOg2VHNuf+yIq2qZ6wFtkW0wyNXxoz3HjzpE=
X-Received: by 2002:ac8:5306:: with SMTP id t6mr20276918qtn.204.1567519412900; 
 Tue, 03 Sep 2019 07:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XfKHpNYXNE_VRaLeGUQa7-hkmUS0nsPfaeSLE4sckKFHg@mail.gmail.com>
In-Reply-To: <CACPK8XfKHpNYXNE_VRaLeGUQa7-hkmUS0nsPfaeSLE4sckKFHg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 Sep 2019 16:03:15 +0200
Message-ID: <CAK8P3a1ESGrYOO4Xa3ikQ=E_vy9-sizTmcJkaqvFPYAaQ52DBQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.4
To: Joel Stanley <joel@jms.id.au>
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
Cc: SoC Team <soc@kernel.org>, arm <arm@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Aug 25, 2019 at 4:10 PM Joel Stanley <joel@jms.id.au> wrote:
> ----------------------------------------------------------------
> ASPEED device tree updates for 5.4
>
> New machines:
>
>  - Facebook Wedge100, Wedge40 and Minipack
>  - Lenovo Hr855xg2
>  - Wistron Mihawk
>
> There's a few other updates, notably some changes to to use the newly
> added SDHCI driver.

Pulled into arm/dt, thanks!

       Arnd
