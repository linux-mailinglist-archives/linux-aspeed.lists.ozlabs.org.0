Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4563A8A11
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Jun 2021 22:17:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4KNv4wS2z307n
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Jun 2021 06:17:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=MruOia1n;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MruOia1n; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4KNl63kXz306J
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Jun 2021 06:17:10 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id h1so9072255plt.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Jun 2021 13:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GkGQnLmVwW4qA0ssOBwk6WCJvW1pndNBd0scdSFPh0I=;
 b=MruOia1n3SSDfMAy6SgZPc8gOiJ2KYRHg1TFB985qFOtyVkwkkmkCTLTgcrvX6tPYe
 LBQxQBXRaYE+gZTN63vld9MyCL6PNNcyL29jtnYOv1uq6lMc/661M6IPWOwaTX332CU4
 EcdZvHlViiMjujNmoBFX79dUIXWtOhGtgC0y5g5yMKWXYXmOErXjZlIoC0XaXhKS4ys5
 OwjCeVAymTQcae9cU/cXcHtp1HgOh6OUny8v2aXp+wPTLg5kBolbDcmScKUwpayrBOMY
 PyYpY4sQX7rUYW0CHvKXRp1yKTj+VVZI6Zo2pSwj+DnpkcMxN0tLz8bdID+ks2vS3WNo
 8/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GkGQnLmVwW4qA0ssOBwk6WCJvW1pndNBd0scdSFPh0I=;
 b=dZED4IruSMHGsHzJSRHNhpYwc1NRnavZCZseUPeglhO5nnpb0tvKqvx3rYYCgAzQBX
 snIXo77cBrMtAgiRQPts67p5lueI2Xh9+Ig5w0wWElWVJEi6ZE8qU3sELOdsUAPgSkOM
 HHv1UZ7R2YMyU1KILU19tIYK1Yv42YW7AryNBgwL4PyYXuPkZorq4VCZC8WBcvsLXPEF
 ngiDeDvUKddTca1mV0eIc21a/3W8I0E9Qq+83ShnQUe3aT34ooHPuEzxjerglTs0XbnC
 qgAajfv1R/xCMju7cewjrLCczliWpvy2JjOnWZfNT6YzEV21rJodISlarK1l9jolR6Bc
 Fhbg==
X-Gm-Message-State: AOAM531OmV5R57am0ru4pJtliHIySP9XVxHlfyWIifc7KKAr9u9qDeCq
 Ly9sXfjf9E3V/ixl6Bwu+3K6IVE1Nl6ASJWHOtNDfg==
X-Google-Smtp-Source: ABdhPJx9P6F6n477bRva9mz30K3tjhbcE6hC9AMxPX01zFv8+yjRUVzQJlRxqjIr9o9+vC0QlqUiP2GEn324NMHYB3Y=
X-Received: by 2002:a17:90a:1941:: with SMTP id
 1mr6812484pjh.217.1623788227394; 
 Tue, 15 Jun 2021 13:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com>
 <20210513193204.816681-6-davidgow@google.com>
In-Reply-To: <20210513193204.816681-6-davidgow@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 15 Jun 2021 13:16:56 -0700
Message-ID: <CAFd5g44OdWFTcj5T0e8uPX-HkT3Dm_X3axJV0bza1SE3BvURmg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] mmc: sdhci-of-aspeed: Remove some unnecessary
 casts from KUnit tests
To: David Gow <davidgow@google.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Daniel Latypov <dlatypov@google.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 13, 2021 at 12:36 PM David Gow <davidgow@google.com> wrote:
>
> With KUnit's EXPECT macros no longer typechecking arguments as strictly,
> get rid of a number of now unnecessary casts.
>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
