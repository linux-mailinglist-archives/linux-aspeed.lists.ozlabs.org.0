Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F329F3D5
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2019 22:13:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46J0Rn2TJRzDqht
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2019 06:13:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J0RV1366zDqcv
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Aug 2019 06:12:51 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id u34so374317qte.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 13:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Le7/DPty+666pMSSFBSolUxx7aiRXx8yMy4J1BfqBIQ=;
 b=BOmg+KvJsvMGXu3SJHE1pkoTBj4CKaxYzAt23ql5+zCgCFqngsa7Rih/BVA4J1umNA
 RNhjkko5cb6y67PoJ+qH1zfJDgVN9FSk9g9z3tMJfMoA3K6sbuTDLDsOspRg+KseCfBr
 apz1xVGG56rAqwU0utVckEGCoHEgkeWb/DljiWqDqm7z5UCP1dG6Ib3ZV31JtGP4I5w7
 awXXaCMPhgh+Ktw5wNZqxLEaAM8405EA1TxkWIZTDrBrKKCNM+2CantrsvEo7ZHESFdG
 nP/JAxBPTERoYwkZ2SZ0kuV7o8d8m8S+4QNqEETI8EHMRI3yjuDQjY1wPzUJ6Ti6HZdL
 ae5A==
X-Gm-Message-State: APjAAAUOiNCkib4cCs8pNsKWYkCSrbqDUvolwpkikgzsRwbfK/3FlqV9
 kFz0ZkNRaom0MmsD/RIKMlZ+W4U6s/S6DoNZIcE=
X-Google-Smtp-Source: APXvYqyEurgHAvSLKroxFOuP9U5ayE6Ghq9iJgArGFYndN0YDBGMpGHoMWmlrrisgnTI8voyhgeUAwkLXq8DOartowY=
X-Received: by 2002:aed:3363:: with SMTP id u90mr689168qtd.7.1566936769088;
 Tue, 27 Aug 2019 13:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190821055530.8720-1-joel@jms.id.au>
 <20190821055530.8720-8-joel@jms.id.au>
 <faf79f9d-baa1-4c8c-a35b-c5d97ad6df8b@www.fastmail.com>
 <CACPK8Xe=mq_Zuw6vsFtb=42ZodbHcizX9QwUoRzY0cDdoWr-Fw@mail.gmail.com>
In-Reply-To: <CACPK8Xe=mq_Zuw6vsFtb=42ZodbHcizX9QwUoRzY0cDdoWr-Fw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 27 Aug 2019 22:12:33 +0200
Message-ID: <CAK8P3a1Dgzrw7nuQR_YJYXSF7Owop2Hpd80bAL0OPhzHMHcbPg@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: configs: aspeed_g5: Enable AST2600
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2019 at 6:43 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 22 Aug 2019 at 02:07, Andrew Jeffery <andrew@aj.id.au> wrote:
> > > +CONFIG_MMC=y
> > > +CONFIG_MMC_SDHCI=y
> > > +CONFIG_MMC_SDHCI_PLTFM=y
> > > +CONFIG_MMC_SDHCI_OF_ASPEED=y
> >
> > The patches haven't yet been applied to the MMC tree, maybe we should
> > add this later?
>
> When enabling drivers in the same merge window as they go into the
> tree we will always be in this situation.
>
> If the driver doesn't make it in this merge window, or first has has
> changes, the worst that will happen is the kconfig name changes and I
> need to update it later. I think we're safe to include it as-is.

Yes, that's fine.

Please also enable all the drivers you need in multi_v7_defconfig
now, preferably as loadable modules.


      Arnd
