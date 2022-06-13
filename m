Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0D5483C1
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Jun 2022 11:54:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM6NJ73DPz3c8X
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Jun 2022 19:54:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DRlFSfy8;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DRlFSfy8;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM6NB3pddz3bkv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jun 2022 19:54:01 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id x138so5260733pfc.12
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jun 2022 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=NgdLA0z7oCb9jXlN+2hfQR8rLO9SjNm0Q9JHfTfVmBA=;
        b=DRlFSfy8Hek0tYzWJZb9W42tzzbiYnNDjvIA0Uj2Rz4QytQisxbqHjMoXKdM1FlhJn
         zSK0WHntHZBLtGh3Z+VBv3PVUMjqDVhdT/bDwwRwfyWQO/iikcxAEL+OEx3LK6ZiUvby
         YkV2GfoCO+QDkdrqeJGWlgRVeJVhHBIrkfkaOE5Y3RoFpxrtF65Iq4lz0IBJTPXc8mm1
         qXSnWEH61FyK/p6kKp5oPH4fw8osFTZIydPNQWO98IcppabC66bUOiG93VknVRvcdSP1
         6VzWztFD+xI2guHXOVwnD11xF53WT4e3Bh5HXZMzJicb9bZPsRPUnHeIihjJ6IHr36Jk
         001Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NgdLA0z7oCb9jXlN+2hfQR8rLO9SjNm0Q9JHfTfVmBA=;
        b=ckn8UFjhob+F1mJYG5aiTKJsW51aZHbEcZflUZuEfCJUKVVAf8WccwLpyCODxhq2LJ
         8jHIw2lgYwEtGoYHx3GEa0tDDCe3Lz1T4WgUk6Js1JK9gGk5/177v5J4oQKotpCikjgz
         5KntcC8LcElx4APRfgBHHgh1kSfhtGX22Kg1FvD2jnBn9AEZS7WsKkGoENqDYfRhRUB1
         7QsrQoKENG096zWSgJHgTJCuMsyx11IosZRRoKeWBD+xXQmFTis6O0RiH6bjReuRDa/l
         r+QoVtFdD+i0pAsjo3gtktC4QCBXdWujOhli1DnZIUODtjP1Ponxdws3f5gye+v4E9ph
         bmYg==
X-Gm-Message-State: AOAM532V/EGWc32aJZ7C6dQl0bPoujgIu03r6zNYc/HWclK/FJ3Vnomy
	mdtgSb+c7a17X1uJOeyGbQE=
X-Google-Smtp-Source: ABdhPJyLBj9u1uHxRvsDhkVgV1jeG58opSfKPMejYeSBEVgr/Qwrlkk27SnwbAlfZOpteN0/l0f4JA==
X-Received: by 2002:a05:6a00:2390:b0:51c:21e1:782 with SMTP id f16-20020a056a00239000b0051c21e10782mr38717687pfc.21.1655114038654;
        Mon, 13 Jun 2022 02:53:58 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902e9d300b001639f038250sm4639754plk.220.2022.06.13.02.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 02:53:58 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/4] Update Facebook Bletchley BMC DTS
Date: Mon, 13 Jun 2022 17:51:46 +0800
Message-Id: <20220613095150.21917-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Update below items for Facebook Bletchley BMC devicetree.

Potin Lai (4):
  ARM: dts: aspeed: bletchley: change LED sys_log_id to active low
  ARM: dts: aspeed: bletchley: disable GPIOV2 pull-down
  ARM: dts: aspeed: bletchley: bind presence-sledX pins via gpio-keys
  ARM: dts: aspeed: bletchley: update fusb302 nodes

 .../dts/aspeed-bmc-facebook-bletchley.dts     | 197 +++++++++++++-----
 1 file changed, 148 insertions(+), 49 deletions(-)

-- 
2.17.1

