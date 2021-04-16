Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E923617AC
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 04:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM0xj0lqbz30hc
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 12:47:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JdqtmxKL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JdqtmxKL; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM0xf4fdsz2yRR
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 12:47:49 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id d23so15450336qko.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 19:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6JE3V5KjaQnEbya4qNgh7qs/JkAupQE4rt/BY5aNrM0=;
 b=JdqtmxKLcTODD3GO/nU6JvyNct+1m/rEgQuVm5NnXzpKx9Myln8OB9VZ2cO2x4smEk
 aNN6MZgsXELHZrl6HFHEXWEPirhCVSRAA9KEPELS3c+cPJXOagyfxj8Gsk1Yw+N9q9ZM
 CbVF/KLhFKyA1sFhOd9EIBKuZgqae0WnZ2tog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6JE3V5KjaQnEbya4qNgh7qs/JkAupQE4rt/BY5aNrM0=;
 b=G5VAI4SdmcZsx4UOR3riai+9ZUKZzkfo3GATYyQyEIg5rq27JyCSoEZRQW6tcSjFsL
 0tRc2jvVhmRHlaFeFYCQDk5CnL9HB+i/wm3joyBK5tDyA+wTI0Oi8tvnzm+wIdRsDUnA
 nlUMhxJI4OL8vlwA4ohjZHU9nfe0PbNnkR2WDQLqjJx+dvRLrk/etUY/eGAnDp2CrDks
 Zjv6mgbB0rFx0k83HYIgGuo+aN88PJvUP0EiWItZy6DKSVOvF+q2o5ChxK/YRYP1SoIw
 9MMPOJyHgbo9TkrfHsUAshmYuxetRP2DxyxstHmf3FquCDbhszmcTgWUceAuJvkeioa0
 /0yg==
X-Gm-Message-State: AOAM533GLF20zcS+IlIpbcICjOrcBmkhbvNshiVBn9/2ieKS1GBzVu08
 gQUv1BIHx6sr+QGt6dpZI5dDg6kc2c5KybotIQ9WhO/D
X-Google-Smtp-Source: ABdhPJwRH0rBofDg5R7VnJqTWOBvdkUj0mitl4J66DsFIFDPjC+jQfQFMHJslh72PksBmcyHiu7HCu5Jv5NyJgnaSe0=
X-Received: by 2002:ae9:e714:: with SMTP id m20mr6835012qka.66.1618541267167; 
 Thu, 15 Apr 2021 19:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210413194308.36930-1-eajames@linux.ibm.com>
In-Reply-To: <20210413194308.36930-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Apr 2021 02:47:35 +0000
Message-ID: <CACPK8XcvMxsFFDvrN1ueRGwFGJ55Yp4N8vNBA9tdfaa5jqzw8A@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Rainier: Various fixes and update
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 13 Apr 2021 at 19:43, Eddie James <eajames@linux.ibm.com> wrote:
>
> This series fixes a number of issues introduced in the Rainier device tree.
> It also brings the device tree up to date with the latest hardware revision.
>
> Eddie James (4):
>   ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
>   ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
>   ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
>   ARM: dts: aspeed: Rainier: Update to pass 2 hardware

Reviewed-by: Joel Stanley <joel@jms.id.au>

I have applied these to send to mainline.

Cheers,

Joel
