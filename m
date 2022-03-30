Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 200A44EB81C
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 04:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSqSM0dxJz2ygC
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 13:02:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=EdwLrbZj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=myI5tTuh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=EdwLrbZj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=myI5tTuh; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSqSH3lQkz2yPJ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 13:02:07 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D7CF5C011A;
 Tue, 29 Mar 2022 22:02:05 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 22:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=LKpOabm7SOo/CuJ7jhONrV0+KXCQn4hSxuNmQ1
 hmqMI=; b=EdwLrbZjTq293GMPh+VbLKeqa/H89ka3CLJmj++4dT69IewU8WOcxy
 FSxzI/vzltyBec7tpiKECqJ0NaF1xThxE4Dx4An+5+/RdlvyNF6dg8lSYPaz+Psi
 ss6z7B3gb/peR6sVq9V0X5Lfw1N6AdN7Ri1h8SCuWwb1do+WvBrWLRp2aUy2gjS1
 kvaqEpbEnwtkwdWz9UfMJFZ7z+N7t1EB0+BKpseY0wM1kT7gHpmaJGzWYbQ4m/oP
 nqwyGoUE+T59PXaBk+YIaDmFXMaWNEFtT826eR6L4C60k0NpmeLm+lpEcX8rqUNB
 5ajJeN+YN1itUR5gmmso7V1gt1hChXmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LKpOabm7SOo/CuJ7j
 hONrV0+KXCQn4hSxuNmQ1hmqMI=; b=myI5tTuh551bP9LkZFyBNAAPFRjJjMTHX
 hYd02yHK5rUW7sNc7F5I3NgNY4FaFXkTMtGMbparVA2OB2wRFjQ/5hZVW/UHXS80
 NlC5h/9/o8RrxoKF2p7K4LDEoHUAknehZVuPGLM95mo3W3ca0fTaFY8802q/ULRs
 2y2Iq9ngRGr89t7gbwHGsNgk7I6MB+BZOXTIW0dtwLXLNg3WaxANrFrN1POf20eA
 c1SVhygK+1zaJ8HfBc0F6KMB4XFwglBSBc5jd9Qp8P3s+5jzvLzcaA43je1O6Jxh
 7VQO1Ke8kcJ0dSJS1Gz4RxA+BeHdQ/L+UKd8aUUdlppA2VktpWHAQ==
X-ME-Sender: <xms:HbpDYo6mlb3CkGoh15jW1oHP08Pf7czUHY_klhPQMfzO0TQubG6Xfg>
 <xme:HbpDYp6aOSP_P9aEt48y92pxUqJUon0poAjjCUe4lh5KgLrzk2BgjyLX9bWkBY8PC
 LGKHq4qdxgT9oK9Qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiuddghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:HbpDYncheUUu75PpCVZTsH2NCbkmB383eErpj2VdAcn3Ojjv3T6Axw>
 <xmx:HbpDYtKVO7kIfw9_lTZe3hEavzPG2utDL-F4thUqYJuDeBDl_8hmAQ>
 <xmx:HbpDYsI61dy2Mf6NWRS7vU7r4m4Q1QYz48ooBlJ2HkV7U9WS4vAvzQ>
 <xmx:HbpDYr9Vn5dqmFMnBL0-3WWaP649lCh8OBSAO0vMC5IikvSuq03eOw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6199AF6043F; Tue, 29 Mar 2022 22:02:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <a4029290-69c4-4df0-8b34-988a281d9cb0@www.fastmail.com>
In-Reply-To: <20220329173932.2588289-4-quic_jaehyoo@quicinc.com>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
 <20220329173932.2588289-4-quic_jaehyoo@quicinc.com>
Date: Wed, 30 Mar 2022 12:31:44 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v3 3/7] dt-bindings: pinctrl: aspeed-g6: remove FWQSPID
 group
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 30 Mar 2022, at 04:09, Jae Hyun Yoo wrote:
> FWQSPID is not a group of FWSPID so remove it.
>
> Fixes: 7488838f2315 ("dt-bindings: pinctrl: aspeed: Document AST2600 pinmux")
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
