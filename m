Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F31323D3821
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 11:55:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWPp65BVXz30C7
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 19:55:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PgwQBnjS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PgwQBnjS; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWPp21Wz6z2yR2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 19:55:35 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id x7so982967ljn.10
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fP0e5+pzHaDijpgYG1lLGjRTibrvPnmwfOfR2a79Oo4=;
 b=PgwQBnjSvLk4x+X2yQe7jp60ecUt1DEGtW2oMScbsZQYq//k/F5P24Ew8ozjmFMAv9
 eJLWQ32egQtmYPHnGW6HvSZ9bECnSmqMdHK/CdIUE2xOzb9PTjHViKBsodCcLS9H9+f1
 Y2v9/uQadwjgUv2+rxkPwgOUbyhQ/tzVSp0ADSKQCeFZREoTBTbLkLfHJpCyU++//o+w
 PPa5gWBS/iR8l/Th/mvFurpKKz6QThYvBgU5z9cAC7//s2s7N2FnEuu/x4BKaszBe59W
 w+5WnT6deW8axtamvoy1MiN6nbQmi9jHGBzH7V68wgdPjVcq5exj2BrLbAasWHSw4Qfc
 4pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fP0e5+pzHaDijpgYG1lLGjRTibrvPnmwfOfR2a79Oo4=;
 b=deGMjDwB+Qw4nX2R0pK3UMduyy4aIq37jiGwxs4A22vNH5ixHr/xQFEsvRd0pL3ZpM
 a/BofWdxB5Z9L8mQd7V9vGNMZh/n0eVrqBmileECMh3/tNDk5/7ygdaKvFPIk1TjZSjP
 Xsrs+Y5rF2V1xkojNK2+niL6YINHgvyMs0SeSZaDoyvlmC0dyIVUEjhLG9wEffRDPxnj
 +HGYlzhURIuNFrq7PpF6/D1eHZjMJAZ5qf7/xdXBRtxcRiMAUR6YQoXM2i0j2KW3we2z
 0nzQjT5zj7uBUq1TFdwI9z+UWi3DUYsfJp0Tgqlp8RDgRxqaflFHVMc09iP/rvNCWPtw
 DsVw==
X-Gm-Message-State: AOAM530MzP8j5zVx8UDFk8OGKDYobLbOuH8J3xjONLo+R3CwPAoCoxXi
 DyYS9TIHEsFDJHvSYK7snTdwjdOuYPLhWEptonU3Kw==
X-Google-Smtp-Source: ABdhPJwPEw7PL/ZNV+knFCr6ygwXtfSSsgPtD8AuMekygxnk/RTl974xpeWic6KoZZjpg5e/ZwPK/u6fHqHmTlKzNJs=
X-Received: by 2002:a2e:908d:: with SMTP id l13mr2708186ljg.467.1627034126232; 
 Fri, 23 Jul 2021 02:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <20210712100317.23298-2-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-2-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 11:55:15 +0200
Message-ID: <CACRpkdY6LZ1+bZkc+Nk3Fr4vn8neYHjMNeAxDR_8u44Nq71+Xw@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] dt-bindings: aspeed-sgpio: Convert txt bindings to
 yaml.
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 12, 2021 at 12:03 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> sgpio-aspeed bindings should be converted to yaml format.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
