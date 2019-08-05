Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB78175F
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2019 12:47:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462Dxk57jjzDqxH
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2019 20:47:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ciULGFpa"; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462Dxc6BByzDqwp
 for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Aug 2019 20:47:48 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id d24so78873005ljg.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Aug 2019 03:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8ev7idhhRdfNKj1s1Ry4AVA7oMVl5Zr3nXpss1zKaI=;
 b=ciULGFpaKJGyGIn8DOiYc74jQEChvVXjT78X89byv515QioWQ8LKIbfQAuDjjBHX0u
 2v96i5afuwQhBnrogqn47DxIdQ6IXLNkLuZlMVG4x6a1f5+CocddiYovSrGgDzIeaYl9
 eh3plobRFsDauaUG3bJ8BELTRTjE8G/gGmjrGwh7GJiYkb3tJLJcGkGeVT1dsHYihhl3
 GYFXPEWHP48uVedVSlamsufiFTMi4tv93b+CpDlI5z2Hw/Ov2d5mulyYBb78YzfeZOVC
 J9cIbZmLoNriGN4BVqAx2ZWMRZuB77qLfRD3VaDOLL88RFAs7lNl5JDiiDfL67UkuCtD
 u1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8ev7idhhRdfNKj1s1Ry4AVA7oMVl5Zr3nXpss1zKaI=;
 b=TwTqwukNtnqOF1VPKs31NNCgqjkNY9nR4Hefcjy74V3xYXfd8dPZv4HF9mUYY531oD
 wwJRfElkQVpk3TQcybsv93KFXew1hN0ppg7up59Gp6SAzgtQ6yd+/aSWOXa5tHYCQUYG
 znLHZubE7p95EtTKYPFE2JlT8bSSWEphOFavX0ZbYAhylHN/urTUd1ZbTL6D3Z7Sqym9
 d+xJhpoM3/GtLwWTUbZvrKWsgFrtxYBqdFxCkWBJ3t7Hs3iSGV4LwFk12VZxG11Wny5T
 8gIKOR5/dhzWOw4xPNAqAV0LDcFvAfX5M4RwlRmF/wf3isrLi13qqfAHZ/aVAo1CcIHe
 bhdw==
X-Gm-Message-State: APjAAAUS2i9XWBLzK8dF/vYWw5VeXd+OLwqKLb1P8IGesg2b8h3SwIXL
 pONR8uyxaBdhKDxnikPqsrkChQv0ThXz3sp5yFfNUg==
X-Google-Smtp-Source: APXvYqwLJr3uamyVrePIy7GYeTGTKZVVFmuCgCeDV0lQp/Tg1tMYwqSStWcsZi8QVF2EtXjzVZWC8D1lN3Mn23V8cVg=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16495379ljs.54.1565002064570; 
 Mon, 05 Aug 2019 03:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au>
 <20190724081313.12934-3-andrew@aj.id.au>
In-Reply-To: <20190724081313.12934-3-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 12:47:32 +0200
Message-ID: <CACRpkdYoiWwm7SeXxWgpJcoiRcNV28CDC3F8FVx5my2Q0KSvvA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: aspeed: Document existence of deprecated
 compatibles
To: Andrew Jeffery <andrew@aj.id.au>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Otherwise they look odd in the face of not being listed in the bindings
> documents.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij
