Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9EBDDBF
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 10:28:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44syVc5nPSzDqPW
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 18:28:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="KCepw7VG"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44syTd5gYczDqKJ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 18:28:05 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id e5so4043875qtq.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pIjwi9Pdwq2tpQOmRVLR8AJ+RfItycNgwKBPS/FfFwQ=;
 b=KCepw7VGzHhTmEryB3hPHprLKpgV2QymJ2RW0SjTSFDdpK0ktwAMBDSJ1ITy+XDh60
 DoPTY09BntxLpOu+kCo5BVMGZNy/qjM3Zj6aUXL1PUv1mNwY/Viwx9hmyBnY3bpuaeNI
 XKNVhhBOR2MP/AIpyjpQxeKiRYyJ8JIVSDDJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIjwi9Pdwq2tpQOmRVLR8AJ+RfItycNgwKBPS/FfFwQ=;
 b=WnB285+Psbr8SKrj55sOrkTXRvbquH6KrtIgbvmdIVpnXgzNvWnC3iQhgwNBq0ujkg
 mXT1bykDYV8FHOpFzvbnWcW8NTcCNQ1J88jTzscF2QSTcb0pZwHWIct2KN8L7naLkFYg
 AqL4Wc0tNj59xhqoWDJncyenGfArqCSZgGG6Odql3yyLwFl9psxfrYMH188+NOzy/57P
 NtaAYrdxVqrjy9+7ZyHUnkzTkKBuwsRmNob0V39Pwp6qfPM+tAPFjdZ7ouRmGRozbxYG
 doj1IgC5yquQN7F8IEu0WXW+sR9agsxD7e2qVq8mMx5GMdGq9fp9Tm29XAZkX+hfFLko
 h5Xg==
X-Gm-Message-State: APjAAAUyYMTy3iZQ5Jh1A3gF3rSUZIizlsTsjKAQAvX/ylGpzCaBQIQO
 V3pDWCagwsr8rQPEb2BVoW/moWdQMlna8VWfwAc=
X-Google-Smtp-Source: APXvYqyIzM18/pZaeSSVKfrsxmgXogVAee5aa7XHdKeT4Kr5aRXtgQ89YiVr3LiG7FMcDqt23jMOQnz29AtcwPe8azo=
X-Received: by 2002:a0c:ac83:: with SMTP id m3mr47431723qvc.85.1556526481157; 
 Mon, 29 Apr 2019 01:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190416162150.150154-1-venture@google.com>
In-Reply-To: <20190416162150.150154-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 08:27:49 +0000
Message-ID: <CACPK8XeTOhcdKPsKgsBJXAYeMDeHRLOSLRF5XO0oT-5XUhghMQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] update aspeed-bmc-opp-zaius device-tree
To: Patrick Venture <venture@google.com>
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
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 16 Apr 2019 at 16:22, Patrick Venture <venture@google.com> wrote:
>
> Hi,
>
> This series contains three updates to the Zaius ASPEED device-tree to
> add voltrage regulators, and update addresses and aliases.  The Infineon
> and Intersil drivers are staged on hwmon-next, and the trivial device
> dt-bindings changed are up for review.

Applied to the aspeed SoC tree, thanks Patrick.

Cheers,

Joel

>
> Maxim Sloyko (1):
>   ARM: dts: aspeed: zaius: add Infineon and Intersil regulators
>
> Robert Lippert (2):
>   ARM: dts: aspeed: zaius: update 12V brick I2C address
>   ARM: dts: aspeed: zaius: fixed I2C bus numbers for pcie slots
>
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 121 +++++++++++++++++++--
>  1 file changed, 113 insertions(+), 8 deletions(-)
>
> --
> 2.21.0.392.gf8f6787159e-goog
>
