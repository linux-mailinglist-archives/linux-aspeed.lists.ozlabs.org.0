Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B93727CD58
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Sep 2020 14:43:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0zb52B2gzDqRv
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Sep 2020 22:43:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xhI9/PHf; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0zYs5G27zDqPK
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Sep 2020 22:42:40 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id s205so3884164lja.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Sep 2020 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wL+1l72oaUbbwBYyOUJaeBQMR0dV1wzd/aL/FIdgzb4=;
 b=xhI9/PHfv+fX23vW8dLBjw1liKAYXb+ehygLbCkVVwhzB6JiSXu+4BSaVZ4K8tBuz8
 5betdA0Zo0dabPQTPyfZgfGTDRQYI5C1gWh0BRD9fKcCBngerR2lOWM6xr3sfq6S2s/Y
 /Mo+9SC2I8EVmdNve7qAhBpn5F9tLTzY/IAKPCo6m5bShm0nxord7LzVA1x87AZPLb12
 UJEziVcQ+xJKvZDAiTNt9Sn9HxG/gC5Yy8gtPpaw5V3T2wyIqipuXwsWfWmCgYiA8zHU
 B6Hzix9baMwWdkCc2y+ggKX7H1oALbOfGl6Dq9X7RQQR7J7/Urh7pkj3jF5MeGQU7tMM
 G/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wL+1l72oaUbbwBYyOUJaeBQMR0dV1wzd/aL/FIdgzb4=;
 b=XbG2JCKgv65W4+eALp5mhly5yblSTEfZqQMt+HaYbwCf1q8F8QsQ/hkbr+NKOwh3HP
 yPszon7OlVyHdfzBAYiQPD3TDYxXyzSsDDt3nyINDsHrnonTTILWvM6/E1Fk+IJus1uH
 Acl595TyHapQYilRsrbFs2CtYOb3cm78YdWFC/WFLNvRKWnX2sOOW/OogdseUYsS0xvs
 pg6cd4I81Sc1fBovDOr0Cysc+2BQcgoyI8VT3AfEf2wITsz+Pu1hq57XTkNBsLVZLPUp
 mNd1ztdA3anfJtTeEN5q28+SklabtJwd228Odw3s/eyzoQaxmXYXflmSWaca6z1EDZ1f
 F6wg==
X-Gm-Message-State: AOAM531xlU1v92TC88PHfAatpZTpkXNPb6an5gLxWoKPoIZiSMH3J/mo
 nBW9zru6/fcj8YvOGifkSMr0FUVrgPsaiQhR36y5oA==
X-Google-Smtp-Source: ABdhPJz/TfA+SJy/EqXpDNJpRqIZcEOun8CwZs40GRQvdlhJ77EBdzNBtnUcoYLOOyqUveIA96w7ow/IynDH7+Culcc=
X-Received: by 2002:a2e:a306:: with SMTP id l6mr1227143lje.286.1601383353717; 
 Tue, 29 Sep 2020 05:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200911034631.8473-1-chiawei_wang@aspeedtech.com>
 <20200911034631.8473-5-chiawei_wang@aspeedtech.com>
In-Reply-To: <20200911034631.8473-5-chiawei_wang@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Sep 2020 14:42:22 +0200
Message-ID: <CACRpkdbn9294JnddMsmGooCe7KCxMiGbuAZ+OAuLwPkZUYD10A@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: aspeed-g5: Fix LPC register offsets
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, rlippert@google.com,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, cyrilbur@gmail.com,
 haiyue.wang@linux.intel.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 5:47 AM Chia-Wei, Wang
<chiawei_wang@aspeedtech.com> wrote:

> The LPC register offsets are fixed to adapt to the LPC DTS change,
> where the LPC partitioning is removed.
>
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>

I can apply this one patch if I get a review from one of the
Aspeed pinctrl maintainer.

Andrew?

Yours,
Linus Walleij
