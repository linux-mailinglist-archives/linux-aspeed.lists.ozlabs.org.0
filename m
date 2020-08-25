Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49156251227
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Aug 2020 08:38:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbK7y3dkJzDqSr
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Aug 2020 16:38:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=d318I0JD; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbK7s4jfmzDqHv
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Aug 2020 16:38:31 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id dp2so9739287ejc.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Aug 2020 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Q9k3xF6hWPOQM3uFwSy2qlWDQ5BGn+QdqRbPCM8EhM=;
 b=d318I0JDAY3KO2OfweXvemxDvpcgVxD/poXqH0o44y89iIIdQ2tKqg8axqlHdT8Acl
 ZwraWTH8Be+wNIdnhcriuFkqqu+TMMH0QJZ/TUNOpruZNRxE9CT0VlMX/CzWe+IZ+AKh
 1i6LQwYPsKVqW8t3f2z5GeVPSUXLalcko0o7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Q9k3xF6hWPOQM3uFwSy2qlWDQ5BGn+QdqRbPCM8EhM=;
 b=f3cBzAdWEzjKqNrdof0bj4Y0F5FOE5e2TrzGSv5nkCTRYnJNS9r4zB6PAIbM5vOQaV
 lkBnRLjCrHx9DZTBAdil6MAYG21QVJwKtn+xCQhZ0L2jbVzGb/brH95K6GOiq4mOWgtn
 LzCEwWoRAgP+l0OrjTA9eTuc12X3LKV5fLzLJepx+LxmW4123qcRHawOgxSuGCHIfVpV
 grlwSqTZxW5lpB3PoMLDdAGDgkuepdIVdXnXFBjYY8tY82RCPP3+zDlwwsFSQdxY0ceG
 qhh3c6BBQ1wHPPpc8GPcyXup4P0PARDynRhG8IWc1fwUBkJjDrF+/KrwA7wDj9PrBDmu
 orFw==
X-Gm-Message-State: AOAM532sFVRO9KErzlXWYbdnsipeV2UQ6he0267ewafmKO/CRVY5BoFr
 Z+U0ql4lJAuXpLfLKyRkzmxSkOIgwxz0jYZ1dfk=
X-Google-Smtp-Source: ABdhPJweMgK6I5TgV9Ly2uJzqR7Tgq7Qn1uQsVbMr86HbZ6rf4REgHoJ8D+2tbHNLahHnsDFOhsp3YQTaEez+w4QafM=
X-Received: by 2002:a17:906:4ec3:: with SMTP id
 i3mr8802552ejv.215.1598337503276; 
 Mon, 24 Aug 2020 23:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-4-eajames@linux.ibm.com>
In-Reply-To: <20200820161152.22751-4-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Aug 2020 06:38:10 +0000
Message-ID: <CACPK8XdG1+3eQPQ71fZYZdHwcn8WNLQKF=5iKrOvGhLwispSQA@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: aspeed: Mask IRQ status to relevant bits
To: Eddie James <eajames@linux.ibm.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, dmitry.torokhov@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 20 Aug 2020 at 16:12, Eddie James <eajames@linux.ibm.com> wrote:
>
> Mask the IRQ status to only the bits that the driver checks. This
> prevents excessive driver warnings when operating in slave mode
> when additional bits are set that the driver doesn't handle.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 31268074c422..abf40f2af8b4 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -604,6 +604,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>         writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>                bus->base + ASPEED_I2C_INTR_STS_REG);
>         readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +       irq_received &= 0xf000ffff;
>         irq_remaining = irq_received;

This would defeat the check for irq_remaining. I don't think we want to do this.

Can you explain why these bits are being set in slave mode?
