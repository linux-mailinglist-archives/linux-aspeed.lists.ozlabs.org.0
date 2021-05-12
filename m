Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C637B634
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 May 2021 08:35:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fg4lt6Ql8z2ymS
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 May 2021 16:35:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jUEVqe1X;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jUEVqe1X; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fg4lm3vX6z2yR2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 12 May 2021 16:34:59 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id 5so7558787qvk.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 May 2021 23:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m0gzjTtB8QgGDKc9baNE5fji+M4gSffyk6B9ol6NXGU=;
 b=jUEVqe1XDHL7tDNQhartGrq92p9/k6UW9fKPRdne7IH/OuCd9L1yYO1wgxpGOTxPSs
 ntkaU7BUzBfp9MXqwm+WL60+vf31gZXNM2dSs0AucAx6Sb7gdO2Clv4dXXCVgawulN0C
 vdmVIaxUSRl/TRx0eodWZZE+6+9psduUNrRLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m0gzjTtB8QgGDKc9baNE5fji+M4gSffyk6B9ol6NXGU=;
 b=KQd4fnb4TS4K/DtUumS0FkhsMLQV9Q5Op4n2dFpcrcB6utwBMkxpTA2ffVKOe34DHx
 3bvKacwtTfsCmNrEP5fQCA704GoAHfUwZaCg7Pc6pJx8/U7Fhm9rm6XV5Q0qq3ppUCgO
 f5ys9o0GkMyUs9TC37G1Zpn6Jmv7OrOmMxkkHbPf5y1iZFXYRkP/SH48bixsT43xXJu1
 djLnchVFxgzOvbdMS3oMAspOhSCmP4L4xwTrx3rD83Z1TfmXBOaZywxwF6zCyx5UuF4N
 M3/cJFWwQFHXs92iPIwJ3EffznyKvPP0p+HuNbxg7v4Hx1xy8cHN8UIxPiMr6HO4+Rmz
 Vbmw==
X-Gm-Message-State: AOAM533E4UOC9Ibpwh1L26blPgwbsDU9mLOxsrbP+iGuickAJvISIknk
 MznLNPMuX6a38PYk6BMvAuVFQ+tcLscYvFrwyKI=
X-Google-Smtp-Source: ABdhPJzCEIxh2H2pOIMO0oGM6WytczIHKo2s4ibtRpIOtbi/FfQbPNDCxuathbrJE3659y5tRD8UwjdUuWE/VcOYors=
X-Received: by 2002:a0c:d786:: with SMTP id z6mr33336335qvi.18.1620801295398; 
 Tue, 11 May 2021 23:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <1620790204-15658-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1620790204-15658-1-git-send-email-zou_wei@huawei.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 May 2021 06:34:43 +0000
Message-ID: <CACPK8XeEHCPXt_xq4YFy5ZAdAuBgoAE0SfcyRX1P39T7Dz6d4g@mail.gmail.com>
Subject: Re: [PATCH net-next] net: mdio: Add missing MODULE_DEVICE_TABLE
To: Zou Wei <zou_wei@huawei.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 12 May 2021 at 03:13, Zou Wei <zou_wei@huawei.com> wrote:
>
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Fixes: f160e99462c6 ("net: phy: Add mdio-aspeed")
Acked-by: Joel Stanley <joel@jms.id.au>

Thanks for the patch.
