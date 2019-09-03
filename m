Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640AA687A
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 14:21:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N5f00ZswzDqSH
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 22:21:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.193; helo=mail-qt1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N5c36cDnzDqjk
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Sep 2019 22:19:31 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id j10so1915617qtp.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2019 05:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/DJSIYh3EZbUDsekqE/ejrRQcrXwQMXahelu/bLINw=;
 b=kKvTQYTya7Ar/WYdVpEZFM1riQpGeHo6A1+DSL2kdSmWMVxd/GkcTbVpcXa9vs1ZAq
 nl3a9KgyLWH/6xHLUxMTZbLU4xRNtVllCjLQ/CjG9KmnCNemGdwHXTgc1hk9psbH6rHD
 c5d1hzjqsmx4hBafzMDkYxLv4xAzhZETXJO2piSr6f16qAbkCHCpEcdWpBkCecO5FymT
 oztuKBa9JeDh5eIm5TyYvZgU4H1mYDmSJdVogvkP38Be2JUAxmHMUQer5el4EeJA0A8z
 paWx38VBXI96TUSf8dlaeVe6jzA8lCVm37YNf87CQgXFVr8ISZTt1bmxJdzJGdbN0avY
 0ozQ==
X-Gm-Message-State: APjAAAVH45tq/2kZFdWoo9yg6S/tpvq2gScaS+kdisJYgLJ3/cC43oYP
 udaznYTD1ODGvRqMGcUE9WEKMQQU70KNamj3Q1M=
X-Google-Smtp-Source: APXvYqxUj37k1++cYore/URYWpEsEnW1S2Ofa5QY6WaKXK8xM6pwsheHaibNOfPqghaplWoJUOSoL1+Ar/OVPAZ9i7U=
X-Received: by 2002:a05:6214:80a:: with SMTP id
 df10mr4999512qvb.93.1567513167699; 
 Tue, 03 Sep 2019 05:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xc1aSp5fXL3cEzC9SJsCXG2JwsSPpQrW3a09dkvhCyHHA@mail.gmail.com>
In-Reply-To: <CACPK8Xc1aSp5fXL3cEzC9SJsCXG2JwsSPpQrW3a09dkvhCyHHA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 Sep 2019 14:19:11 +0200
Message-ID: <CAK8P3a10eKP6cJUw-SHam1zBMZe-FOhVcBn01TT_VVFYHrUA-w@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: arch changes for 5.4
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
>
> Hello ARM Maintainers,
>
> Here's my first mach-aspeed pull request. We finally had to add some
> code here to support SMP on the shiny new ASPEED AST2600.
>
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
>     tags/aspeed-5.4-arch
>

Pulled into arm/soc branch, after changing Olof's patchwork wrapper script
to ignore the '\' character at the line break.

Thanks

       Arnd
