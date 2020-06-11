Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD51F6771
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2020 14:06:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jMyr27LvzDqnM
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2020 22:06:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NxTo1jQy; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jMxl1BKXzDqpC
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jun 2020 22:05:30 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id gl26so6156195ejb.11
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jun 2020 05:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bXfqD7gSvjz6LJbKoi0/E9CrX3G1dDgq7x+YbDEOdME=;
 b=NxTo1jQy5E3dUlcBdualrF+kOZmZ8ehdQqanHWK4t7CQcGWEe2xIGxroxIuHGXUcS0
 5cOIn3TsC9mL6OUHFTtYNN+58fdIhwTgKBpUAtOmnrB/MGuQexWyXk5/PfcXfdzB6ab/
 LyDoRHD/5u1KJ0LMcU8skNIvGrXqEu4sSf9Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bXfqD7gSvjz6LJbKoi0/E9CrX3G1dDgq7x+YbDEOdME=;
 b=hhLyrBP8GB6GRwobRkL1V517d7lXlTiVOGOiwPDRmZyuwVgUyE3A57ZicO+ZySbrk2
 hrhVopt4cdV1sLg7IiZvuC1P3R5020Uj3q4rvBpBnlX4A6UbsZmoKUnksFAlpNUt5E2+
 LLlRb9O8mWWlDG+uuNhUTS63HrydfvPlkc7J13p15Vi0u7apVKBGbNAscGUTBj/CgPIw
 OICvA4KLqcvPq3CEo6FncrR77KNKYZxlx4bMxk7jQFdNVGpxU5oqz2fkbRHEG3ddCT5Z
 iwlcNHN/14xTDNbpHMSW9X/I1CXUC+vH+RoJnhMoSFM/l94QPVnJN0LE6fXMadCswBh9
 zMfA==
X-Gm-Message-State: AOAM532T3VGyK5QtN3NGc7cW/mgseD8K46LmkTCKDo7lVOuDwCSixiBF
 LRvrKN3bL4m0fA46PVTkFWsXJn1KqVCUWdhkIkU=
X-Google-Smtp-Source: ABdhPJzUsNY6R4Fzc0QWGa0H2nbfLpgV3jjxAFbpDdyM/8hbo0xN8i0rnjvPBa9qfyxJ3vXqnHvTtkwBcmbS2ZBaWY0=
X-Received: by 2002:a17:906:9243:: with SMTP id
 c3mr7985996ejx.400.1591877124345; 
 Thu, 11 Jun 2020 05:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200429113711.13183-1-a.filippov@yadro.com>
 <20200610081500.GA27959@bbwork.lan>
In-Reply-To: <20200610081500.GA27959@bbwork.lan>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Jun 2020 12:05:12 +0000
Message-ID: <CACPK8XeGPBYcaR-Y2AtGsqfK3P722qWUU+46Op0S600Ohf4H_A@mail.gmail.com>
Subject: Re: [PATCH v7] ARM: DTS: Aspeed: Add YADRO Nicole BMC
To: "Alexander A. Filippov" <a.filippov@yadro.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Patrick Williams <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>,
 Andrew Geissler <geissonator@yahoo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 10 Jun 2020 at 08:15, Alexander A. Filippov
<a.filippov@yadro.com> wrote:
>
> On Wed, Apr 29, 2020 at 02:37:11PM +0300, Alexander Filippov wrote:
> > Nicole is an OpenPower machine with an Aspeed 2500 BMC SoC manufactured
> > by YADRO.
> >
> > Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
> >
>
> ping

Reviewed-by: Joel Stanley <joel@jms.id.au>

This missed the merge window for 5.8. I will queue it up after -rc1 is
released for 5.9.

Cheers,

Joel
