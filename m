Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91887AA7B8
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 17:52:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PQF06Z4HzDr1F
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 01:52:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PQDW2qq7zDr1F
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2019 01:52:08 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id u40so3334556qth.11
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 08:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hJUoUKMyHFFk9Ggcl9KNkce6XFsFI42bscDZ4mcnBIU=;
 b=f2mu3aY2Sp5AhHryxOKLOrkT9QDL8mfjYXTiRzz2967rL1l096J46BvsERcaxdnK0N
 wmAU7ySo51s4yDTMs6qcI/FO+3VHvWJuHUXLocn/7aFmJivRJeQP1aYWvFKnPP/9Ntn8
 wPn3jZN9nLTld1a8bv8+vvPUDEq1Z7KyRyDdda8bLgFd6igqXuCDQcvVEgLNlxQuzuu0
 CzlQrg08vrmjJr8KtWortftSbAANbhXAqAqWnqPQIrhJ7TlLci91SmXGeP3gtgbF2qK2
 R1P1hRE0/VHDwcdG6q9WKhEgWm/8LxylKzuiFoliif0ysqrWa+gFaW/b2+G2ELO9SuUZ
 cknw==
X-Gm-Message-State: APjAAAUSNClIyBMSKC8SIMxrMbbyEg16W3aQ3xQaeFei3PaG5U+TUI5+
 XlkKmNsthKnLLdJuYkJkBETHA7ZVjbNCD2aTQGw=
X-Google-Smtp-Source: APXvYqxP0Igsd3rt23FCju+duUZdmf7tF6sOX2UBQ87OlqWc2jWSjzRmUOli5SrBElIAJWm4cJ6/eVS5IahPIguwQ/w=
X-Received: by 2002:ac8:5306:: with SMTP id t6mr4188392qtn.204.1567698725012; 
 Thu, 05 Sep 2019 08:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xdp4gVuetmiu2bRTTH6oHhRrC7FELHWKVB2ZGSbPbH7HQ@mail.gmail.com>
In-Reply-To: <CACPK8Xdp4gVuetmiu2bRTTH6oHhRrC7FELHWKVB2ZGSbPbH7HQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 Sep 2019 17:51:48 +0200
Message-ID: <CAK8P3a0Vjwgyrw9wZLr1=W85FbvgZ=RADSHoL_JscvELMdF=qw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.4, round two
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

On Thu, Sep 5, 2019 at 2:43 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello ARM maintainers,
>
> Here are some late fixes I collected for the ASPEED boards.
>
> I've thrown the commits on top of the ones in the first pull request, which
> you've merged. I've not sent a second pull before so if that's not the done
> thing then let me know what you prefer.

This is the best way to do it.

> ASPEED device tree updates for 5.4, second round
>
>  - Alternate flash support for Vesnin
>  - Minor cleanups and fixes

Pulled into arm/dt, thanks!

     Arnd
