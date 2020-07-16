Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E1E222E7C
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jul 2020 00:19:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B77wM5hqGzDr4d
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jul 2020 08:19:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eHu1cIr7; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B77rr74hSzDqND
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Jul 2020 08:16:44 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id o22so5355785pjw.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jul 2020 15:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyJjNcCyaCd1x5/819IrrY1FHu5p7NCmrwELbf92SAw=;
 b=eHu1cIr74RawyPqX0Cqg3kfkYi/drr3HXHWhaWKTivMGMKCMf3e0XRoQ2En4jdjC4o
 l0QXBXm6ndcTw0e1BnIhRnI9fmTiAZsUsu0D17CFOrD4RGcofnUAKaBCktK0WZ3HIVfj
 xabBG2ZxSqmkP5rHOF+BNiSMHYS5PaLoIfFLIMpffgQpnHBG0JhA3lwQzxqpQJRN1Igr
 Ol5E/Gp0zFDAv77oilMTq1A6jnLxF8MKYnrfILiWK6THw1VBn9dDuu8Xz+SeXubQM64h
 RRBKDl3Y3FuU2gfHgGMY94DzYfV9XveiQNE1WNtju12Jzz60Joi1KZzd8kS0V40voa54
 cnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyJjNcCyaCd1x5/819IrrY1FHu5p7NCmrwELbf92SAw=;
 b=ui0awBdIuy75dnAtIltOFGG2AE3fvUvQmIulY846V2UxhkdBuvUpbl78C+Jxvvjntu
 35VHOwsM1y3sJcpmhd7NymZO+3/koPOWl/G6VOqJAPXUPiODIRvHEk28CwacgNRhvVwF
 8FP9rWnnSmwiUQa8b3Mv1KW43cLOgo1OIh4m58nMTNz1lHPqKNUmAYKC5dRXN2iTJClE
 6VOY3QU+2WxhvI7SrgJnJ4LxzDN0isGKkT2cwRgV467UOvZhigbGcF8clbuKM3SPQg6t
 pqO2DJRDEqnFBincuSqbFOczsxs/XjwuBQy4nNer90XxVuem18MD/sUvMp+4q1rPfXOq
 2m9Q==
X-Gm-Message-State: AOAM531TsTGwtIeZpFTVpfkZ+anmV9BrcWODdnidrfX5m5Y6E2YMYWQ9
 n4RHff9BPxqmcYYWlqIQjgsF4Wbij9z0JrFfx0Ak+w==
X-Google-Smtp-Source: ABdhPJzd3SJxIS4HsCUds4zwHzaxq83M1tXUciur4bETKG0e7fh8+z+LpQ32CtOhhi4oDDmKD7oe/79nInT7mEGSln8=
X-Received: by 2002:a17:90a:cc03:: with SMTP id
 b3mr6368860pju.80.1594937800591; 
 Thu, 16 Jul 2020 15:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200716215242.GA19193@embeddedor>
In-Reply-To: <20200716215242.GA19193@embeddedor>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 16 Jul 2020 15:16:29 -0700
Message-ID: <CAFd5g44yqds4xUp=xVbXTpFZydLobfpyLrVdwZOjrRa4=TOj5Q@mail.gmail.com>
Subject: Re: [PATCH][next] i2c: aspeed: Use fallthrough pseudo-keyword
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jul 16, 2020 at 2:47 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
