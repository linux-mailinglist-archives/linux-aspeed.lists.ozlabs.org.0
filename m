Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97178357990
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 03:31:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG3d61QPtz30CS
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 11:31:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HJJYQfK4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HJJYQfK4; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG3d25przz2y8F
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 11:31:16 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id c4so680509qkg.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Apr 2021 18:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=omgZGso3Y2XA/JkU9vKdbNURlJDiCo9Q4DyTBcUNgeg=;
 b=HJJYQfK4b5Ag286AjTEoI2Anl0yx6w1iqvckosWl7ArMrXGU92ONdlt0XU38YA6Afa
 7aCLcos5ESVoKuO2Si8+bDDft3BMAjBwqFCiGse5gRhm/pQ4GIDG0DFpEGOC5A8wlB7O
 8X75b6NBmCp18aYe1F2fNDqYq3unYEcAgF6lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=omgZGso3Y2XA/JkU9vKdbNURlJDiCo9Q4DyTBcUNgeg=;
 b=i0CbCYzdsQ0NKfLzxLUD/m9P2R9JCqmW/IXTYgQFeSEKuKfGKMy3Q6Vh1Ph3z4TT8x
 Gvr6oMnfnoAJVhxcvcL9rY7ylBH1QSNCdz50MDysiHNvedRjBvem3bryT3q0ARsXA+1F
 Jv/orF2uv/4R8ewQU49SVNXwLCWUHY3uUQhFyKBemDiBn5+4Myu8j4kMBZY0lRsyZU5D
 nZz97kTqZBndJeu8s1iMGMJL7V4RiHQgeWjRxAhkEsSQzYqu6O+8wCggmWabS0ptPb4x
 4FwtPffC9KjzfbHRKIQgpqgtviwvUtoo8ODkdi/k8c8ZiLUKg3KSzUL8P/y3zGjvLNYU
 AO/w==
X-Gm-Message-State: AOAM533TGwQ9iiwD7Ps2ejyd08rTjAaE4Yr63NmyST4xzLDL7nsGIL4n
 2S8xuNkbLr4wcfGFhAelquFWOt0jkWYuY3uFXESY9VmC
X-Google-Smtp-Source: ABdhPJzu4hhBFEZFvKK8iRFcA6QQfNTAGlfMo3QugCKFT+2urZwKDGxIUjegqL7HZleKULA9Ck40Rg0OLJMicjKb76Q=
X-Received: by 2002:a05:620a:1410:: with SMTP id
 d16mr6121510qkj.465.1617845473690; 
 Wed, 07 Apr 2021 18:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210329150020.13632-1-eajames@linux.ibm.com>
In-Reply-To: <20210329150020.13632-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Apr 2021 01:31:01 +0000
Message-ID: <CACPK8Xdfuc1E8Rh=zgO6An+oJvikkDs_Ch1v0-v3rdC50WCZTA@mail.gmail.com>
Subject: Re: [PATCH 00/22] ARM: dts: aspeed: Updates for Rainier and Everest
 machines
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
Cc: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 29 Mar 2021 at 15:00, Eddie James <eajames@linux.ibm.com> wrote:
>
> This series updates the device trees for the Rainier and Everest system
> BMCs. For Rainier, the changes have been tested fairly extensively in
> hardware. Everest has largely been tested in simulation and some basic
> hardware verification testing.

>   ARM: dts: aspeed: rainier: Support pass 2 planar

This patch does not build, suggesting it has not been tested. I fixed
it by adding the extra fan nodes that rainier was missing.

How about we support only the latest planar in the mainline tree, and
support for older versions can be carried in the downstream tree?

>   ARM: dts: Aspeed: Everest: Add max31785 fan controller device

This has been applied, but without the properties that are not upstream.

>   ARM: dts: aspeed: rainier: Add Operator Panel LEDs
>   ARM: dts: aspeed: rainier: Add leds that are off PCA9552
>   ARM: dts: aspeed: rainier: Add leds that are off pic16f882
>   ARM: dts: aspeed: rainier: Add leds on optional DASD cards
>   ARM: dts: aspeed: rainier: Add leds on optional PCI cable cards

These need to be re-worked to use the PCA driver directly instead of
exposing PCA LED devices as GPIO controllers and then attaching
gpio-leds to those GPIOs.

Country to previous concerns raised, there was no issue with "holes"
in the layout but instead a desire to avoid the "pca955x:" prefix in
sysfs. For now userspace will ignore that prefix when matching
devices. I also have a proposed patch to remove them:

https://lore.kernel.org/linux-leds/20210325005456.152469-1-joel@jms.id.au/

The changes I have merged have been pushed here. Please double check
that I've merged what you expected:

https://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git/log/?h=for-next

Cheers,

Joel
