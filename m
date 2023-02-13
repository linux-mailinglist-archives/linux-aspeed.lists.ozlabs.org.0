Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E159693EDE
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 08:21:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFbPL1LSDz3c65
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 18:21:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rhbucKsa;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rhbucKsa;
	dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFbPB0q2Xz3bfw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 18:21:31 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id bj22so9427224oib.11
        for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Feb 2023 23:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tu3Rg9Nc9tQdXwpvmhafgzXQ8RyOPEDDD2j9N3bOJ9Y=;
        b=rhbucKsaF7+Mk5ib60jTJ4D0s6/wXI1ilnFVZL1k4ehPJhvQbhPNAXBSEuaB7pBRI6
         YzV7Vy78+B/h5/Q3qudP6b37y3hwjZTMu/9swOgfDQF3UQX/M1VBwGHZs1gPxoRUPylD
         7KaOtEwpu5DsCLNyqKLu/GEOR7Uq7t4ZJMIHJNwlJzVBqPtgW7Qtg/DzzDpUYpsLoiRS
         VY8k9f4nfwTL8v1/OTSBBTceUOOLdfHKNdfL2afWwk2TlKKsEmqm/VgFZYcwCKCiQUQA
         FIijhynrGCRyo/ZGOIYVhi2QxxZ6rB0sX6CyETwBpA8aqIc/+2mvCjusVthnscPfCu3v
         tkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu3Rg9Nc9tQdXwpvmhafgzXQ8RyOPEDDD2j9N3bOJ9Y=;
        b=7ZHiRiJzX0mtbYNtE6KaIbsYd7HGlWFh164NRKULjx4CorN1QWbR4pCwdNT2a7aBTs
         gpQtCTeIbHywSDoOFk+QdgrbKgYUk7jW+6QW9/n292VJEt4x26Eg2sFNqnf/LH0q4RVK
         Jn0ULEGPr6R5Y4G/57E3S/4AU9+gloLjX67TYq7EUY/++kI+0jtJfneKWSHWtoHOIrlN
         HE+5VpeI0gyRU5PnoYx+MvrdQLdOlFxmP1ZAYtWwWPZFQE9FpGYP4A7mdSIqVwbA1Wix
         tW+R+elmnphnf4P8ngWLaKURStWP1BZ6354unM0SrKltQ4Jm8WQ+lrOTm/UdpCSmt7tN
         pgBg==
X-Gm-Message-State: AO0yUKUr178NbhklXp+1hLHhGgERGxA/8xUZO2aw5mp2nsM0sSJyocS+
	ZS7x5MuZ/HUMC9kfrvkLGLrMbvpr/Eg+wO5+d4Bfxw==
X-Google-Smtp-Source: AK7set/e0bJVfEBzygvuQJIzqcbZTs/OUfDWmBy0vBYsOf67t1TDn9nW5hUaKrWnY73k1wjEjHI3BRLZg/+VRobb8wc=
X-Received: by 2002:a05:6808:60d:b0:37b:7c36:4df8 with SMTP id
 y13-20020a056808060d00b0037b7c364df8mr1721341oih.144.1676272888357; Sun, 12
 Feb 2023 23:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20230210103829.74470-1-jordan.chang@ufispace.com>
 <20230210103829.74470-2-jordan.chang@ufispace.com> <12424bbd-cd3c-4d96-a7d8-1c83241b845f@app.fastmail.com>
In-Reply-To: <12424bbd-cd3c-4d96-a7d8-1c83241b845f@app.fastmail.com>
From: Jordan Chang <jordan.chang@ufispace.com>
Date: Mon, 13 Feb 2023 15:21:17 +0800
Message-ID: <CAJ3czeQSEv48M=_DWHs1-b7OxLccY1xe-VfNYRq9JUv_fHt3WQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] ARM: dts: aspeed: Add device tree for Ufispace
 NCPLite BMC
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
Cc: jay.tc.lin@ufispace.com, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, eason.ys.huang@ufispace.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Thank you for taking time to review.

On Mon, Feb 13, 2023 at 9:56 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > +
> > +     temperature-sensor@4f {
> > +             cpmpatible = "national,lm75";
>
> s/cpmp/comp/
Will revise the typo.

Best regards,
Jordan Chang
