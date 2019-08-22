Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B74A998A7D
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2019 06:44:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DX441PYGzDqtm
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2019 14:44:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="D1q9lH02"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DX3x45gJzDqss
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 14:43:57 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id m2so3971007qki.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 21:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OJYGyBg/ceLSDjtApXeg+QYPHZlKNwzKjUa+6OSFeUo=;
 b=D1q9lH02crG0hVsSBHPDz4Ty4HHcz8uyhNg9zQlxODrOvuYxeTHbGEOpCeARUKNIc8
 CsKSL/M/Vp4b0TkraUwdiA0FHEyNiShpWbpIh6c/sY45K/P791GuVCHgLILJz4fPi1rH
 LL/0LmTxDTPyzUpomzWrXr+nNoZOwBRCJHWNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OJYGyBg/ceLSDjtApXeg+QYPHZlKNwzKjUa+6OSFeUo=;
 b=GWt7BusPYnmWsY2pSai6EzxQ0O1EI41umTvZCQSItN7lHtFAUHf6ZL7/5V8Ur/3SPP
 2CeJdvRkIfG8ofqs5J4PMBOlFEXT1ZRQGcaJlfeFItYHLcfDuAGfmNfHt2Y5z1mwPFHE
 vDB4y9wnZ0LZ1X2JWAzfhgBYoWvUgOtU+RolOt1Gu4ioi056zjIR9h9qhOdYnN3QqcYM
 hkSRVA+lH6SLhX+6IZ8qWvDUOCXsKtGQ5rwMshqNrcJnqf8RjrrOK3hftH9p1m5G4/s+
 ulEz4O+ug4Fp5wUiAr8ZOu/yCl7eMKalgVEjJFzULfjUHvrAURL5kyGD20/6bOOGvn4T
 Icnw==
X-Gm-Message-State: APjAAAVl9Rc2T3MELOzK6KGiY41wvXHFQ4EekkrMEzCkFBM0jL+Bu2uT
 cKK30jLt3NEprs1xahxVEIIc+LnbXRXD6atuye4=
X-Google-Smtp-Source: APXvYqw7+6RHrrapRSIiCA1W4LX4FEsS39J4H0GHx8pMtsjmQmcpotn5m7W2/GkBsc1gILGchs2Kr22CmwLnNjW//2Y=
X-Received: by 2002:a37:649:: with SMTP id 70mr34466573qkg.208.1566449033127; 
 Wed, 21 Aug 2019 21:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190821055530.8720-1-joel@jms.id.au>
 <20190821055530.8720-8-joel@jms.id.au>
 <faf79f9d-baa1-4c8c-a35b-c5d97ad6df8b@www.fastmail.com>
In-Reply-To: <faf79f9d-baa1-4c8c-a35b-c5d97ad6df8b@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 22 Aug 2019 04:43:41 +0000
Message-ID: <CACPK8Xe=mq_Zuw6vsFtb=42ZodbHcizX9QwUoRzY0cDdoWr-Fw@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: configs: aspeed_g5: Enable AST2600
To: Andrew Jeffery <andrew@aj.id.au>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 22 Aug 2019 at 02:07, Andrew Jeffery <andrew@aj.id.au> wrote:
> > +CONFIG_MMC=y
> > +CONFIG_MMC_SDHCI=y
> > +CONFIG_MMC_SDHCI_PLTFM=y
> > +CONFIG_MMC_SDHCI_OF_ASPEED=y
>
> The patches haven't yet been applied to the MMC tree, maybe we should
> add this later?

When enabling drivers in the same merge window as they go into the
tree we will always be in this situation.

If the driver doesn't make it in this merge window, or first has has
changes, the worst that will happen is the kconfig name changes and I
need to update it later. I think we're safe to include it as-is.

Thanks for the review.

Cheers,

Joel
