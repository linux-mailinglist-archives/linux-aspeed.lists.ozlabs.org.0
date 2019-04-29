Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB87DD34
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 09:54:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sxkW6py6zDqMX
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 17:54:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="QBxjZ6/o"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sxkR4BxczDq9D
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 17:54:07 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id c35so10910697qtk.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KWgCkKPfgLe0gODXDRVabcCo8RdveLj5EodL4BepQwo=;
 b=QBxjZ6/oxpq6tExNEmdlt5qqmHZSVRrvHDTc+7z7QFME9MlAxao2y0Mf3fgL3QOvUn
 3ojdnuE2FRclx7G+rgsgtX3VxxZKTU8/OUyHqQ7s87OLiGU3feI17TVpZJSZHtNF6M/Y
 OPlvuHIJCVasxqLTvKkkAhRm+bN9gyfTk/0hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KWgCkKPfgLe0gODXDRVabcCo8RdveLj5EodL4BepQwo=;
 b=s1IoKXz4PbHt8IWeB+IPoJwkQkQzr+SkNn/7thYQji4DHMGpK1/Fh3DRyTHopkYzHA
 tvE8pL511jCnj8+E6EOE4TDbEyuQ+HmUjzIVxvxA0Q0GcCAu1U7iDN82RNMwDKTfCp+b
 SHHzljZJBvoNgvt6fU7arBEotiCWPeRcQe1kFJcIyPHqX7NUyJXdIW/XDfamzghZNInj
 RP5Uw+LumvbXfjCI2aC4GJzTapXYkQgpZ4pNrLFnQcRSNmL2Q8BWVPi8evb01WvPFOXy
 v7+Nj4rI8qjEYnfNPsIKYjNf2Qe2d4KDc8Ixfil4daCpON2h3IX1xHv4M1FZVsFsponI
 Iiqw==
X-Gm-Message-State: APjAAAV4DyfG0kXWLVfE56n1ycA3JZM5PZtLJNrpU0sbl9j23fXi4rjX
 nuzxNEUvSKuVgWHa/k1MAsoZateugPmuXkT2Fqg=
X-Google-Smtp-Source: APXvYqzuweVqEIbGAUxpYzmfY5Jlihfnu2PP5Rq/2cEC87hGr9WIb/S7SiEJVR+p6CHs6sv5l0jiC6+WCcgT8ud376E=
X-Received: by 2002:ac8:2565:: with SMTP id 34mr49117430qtn.37.1556524445302; 
 Mon, 29 Apr 2019 00:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190425194853.140617-1-venture@google.com>
In-Reply-To: <20190425194853.140617-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 07:53:53 +0000
Message-ID: <CACPK8XchRsfJkB_p07g6LOyakaq8XH9yM3ve9annfNTTkGY4rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: Add aspeed-p2a-ctrl node
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
 devicetree <devicetree@vger.kernel.org>, arm <arm@kernel.org>,
 linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 25 Apr 2019 at 19:48, Patrick Venture <venture@google.com> wrote:
>
> Add a node for the aspeed-p2a-ctrl module.  This node, when enabled will
> disable the PCI-to-AHB bridge and then allow control of this bridge via
> ioctls, and access via mmap.
>
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to the aspeed SoC tree.

Cheers,

Joel
